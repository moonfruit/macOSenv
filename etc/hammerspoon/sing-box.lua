-- 服务状态监控器
local serviceMonitor = {}

-- 配置
local CONFIG = {
    url = "http://127.0.0.1:9999/version",
    checkInterval = 5,                                             -- 检查间隔（秒）
    timeout = 3,                                                   -- HTTP 请求超时时间（秒）
    scriptPath = "/Users/moon/Workspace.localized/env/bin/dnsctl", -- 脚本路径
}

-- 状态变量
local isServiceOnline = nil -- nil 表示初始状态，true 表示在线，false 表示离线
local timer = nil

-- 日志函数
local function log(message)
    print(string.format("服务监控器: %s", message))
end

-- 执行脚本
local function executeScript(command, callback)
    local fullCommand = string.format("%s %s", CONFIG.scriptPath, command)
    log(string.format("执行命令: %s", fullCommand))

    local task = hs.task.new("/bin/bash", function(exitCode, stdOut, stdErr)
        if exitCode == 0 then
            log(string.format("命令执行成功: %s", command))
            if stdOut and stdOut ~= "" then
                log(string.format("输出: %s", stdOut))
            end
            callback()
        else
            log(string.format("命令执行失败 (退出码: %d): %s", exitCode, command))
            if stdErr and stdErr ~= "" then
                log(string.format("错误: %s", stdErr))
            end
        end
    end, { "-c", fullCommand })

    task:start()
end

-- 发送通知
local function sendNotification(title, message)
    hs.notify.new({
        title = title,
        informativeText = message,
        withdrawAfter = 3
    }):send()
end

-- 处理状态变化
local function handleStatusChange(currentStatus)
    if isServiceOnline == nil then
        -- 初始化状态
        isServiceOnline = currentStatus
        log(string.format("初始状态: 服务%s", currentStatus and "在线" or "离线"))
        return
    end

    if isServiceOnline ~= currentStatus then
        if currentStatus then
            -- 从离线变为在线
            log("状态变化: 服务离线 -> 服务在线")
            executeScript("set 127.0.0.1", function()
                sendNotification("DNS 设置已更新", "DNS 已设置为 127.0.0.1")
            end)
        else
            -- 从在线变为离线
            log("状态变化: 服务在线 -> 服务离线")
            executeScript("clear", function()
                sendNotification("DNS 设置已清除", "DNS 设置已恢复为默认")
            end)
        end
        isServiceOnline = currentStatus
    end
end

-- 检查服务状态
local function checkServiceStatus()
    hs.http.asyncGet(CONFIG.url, nil, function(status)
        if status == 200 then
            -- 服务在线
            handleStatusChange(true)
        else
            -- 服务离线（非 200 响应）
            handleStatusChange(false)
        end
    end, CONFIG.timeout)
end

-- 启动监控
function serviceMonitor.start()
    if timer then
        log("监控器已在运行")
        return
    end

    log("启动服务监控器")
    log(string.format("监控地址: %s", CONFIG.url))
    log(string.format("检查间隔: %d 秒", CONFIG.checkInterval))

    -- 立即执行一次检查
    checkServiceStatus()

    -- 设置定时器
    timer = hs.timer.doEvery(CONFIG.checkInterval, checkServiceStatus)
    log("监控器已启动")
end

-- 停止监控
function serviceMonitor.stop()
    if timer then
        timer:stop()
        timer = nil
        isServiceOnline = nil
        log("监控器已停止")
    else
        log("监控器未在运行")
    end
end

-- 重启监控
function serviceMonitor.restart()
    serviceMonitor.stop()
    hs.timer.doAfter(0.5, function()
        serviceMonitor.start()
    end)
end

-- 获取当前状态
function serviceMonitor.getStatus()
    if isServiceOnline == nil then
        return "未知"
    elseif isServiceOnline then
        return "在线"
    else
        return "离线"
    end
end

-- 自动启动监控器
serviceMonitor.start()

-- 返回模块
return serviceMonitor
