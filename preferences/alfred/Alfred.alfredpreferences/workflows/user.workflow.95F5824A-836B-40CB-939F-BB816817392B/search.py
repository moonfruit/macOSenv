#!/usr/bin/python
# encoding: utf-8

import sys
from workflow import Workflow, web

def search(query):
    url = 'http://localhost:48065/wechat/search'
    parameters = dict(keyword=query)
    response = web.get(url, parameters)
    response.raise_for_status()
    return response.json()

def main(wf):
    query = wf.args[0]
    try:
        for contact in search(query):
            title = None
            if 'm_nsRemark' in contact and len(contact['m_nsRemark']) > 0:
                title = contact['m_nsRemark']
            else:
                title = contact['m_nsNickName']
            wf.add_item(title=title, subtitle=contact['m_nsNickName'], arg=contact['m_nsUsrName'], valid=True)
        wf.send_feedback()
    except:
        wf.add_item(title='Failed to connect to the WeChat.', subtitle='Please open your WeChat.app and retry.', valid=False)
        wf.send_feedback()

if __name__ == '__main__':
    wf = Workflow()
    logger = wf.logger
    sys.exit(wf.run(main))
