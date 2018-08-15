#!/usr/bin/env bash

# Install Wee-elack
pip install --upgrade pip setuptools
pip install websocket-client
mkdir -p ~/.weechat/python/autoload
wget https://raw.githubusercontent.com/rawdigits/wee-slack/master/wee_slack.py -O ~/.weechat/python/autoload/wee_slack.py

# If the Installation is finished open Weechat
# /set plugins.var.python.slack_extension.slack_api_token [YOUR_SLACK_TOKEN],[YOUR_OTHER_SLACK_TOKEN]
# /save
# /python reload

# Install Hacker-News
pip install haxor-news
