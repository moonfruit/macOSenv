#!/bin/bash
LAST=$(curl http://query.ruankao.org.cn/score | pup 'ul.select li:last-of-type text{}')
NOTICE="最新成绩没有公布"
if [[ $LAST != "2018年上半年" ]]; then
	NOTICE="已公布**$LAST**成绩"
fi
echo "$NOTICE"
terminal-notifier -message "$NOTICE"
