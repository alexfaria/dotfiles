#!/usr/bin/python

import sys, os, re

p = re.compile(r'(status)|(file)|(artist)|(album)|(tracknumber)|(title)|(date)|(duration)')

# with open('workfile', 'w+') as f:
#     f.write(' '.join(sys.argv[1:]))

dic = list(filter(None, p.split(' '.join(sys.argv[1:]))))

items = {
    'status': dic[dic.index('status')+1].strip()
    # 'artist': dic[dic.index('artist')+1].strip(),
    # 'album': dic[dic.index('album')+1].strip(),
    # 'title': dic[dic.index('title')+1].strip()
}

if 'artist' in dic:
    items['artist'] = dic[dic.index('artist')+1].strip()
else:
    items['artist'] = ''

if 'album' in dic:
    items['album'] = dic[dic.index('album')+1].strip()
else:
    items['album'] = ''

if 'title' in dic:
    items['title'] = dic[dic.index('title')+1].strip()
else:
    items['title'] = ''


title = "\"Stopped Playing\""
message = ""

if items['status'] == 'playing':
    title = "\"Playing\""
    message = '\"' + items['artist'] + ' - ' + items['title'] + '\"'

if items['status'] == 'paused':
    title = "\"Paused\""
    message = '\"' + items['artist'] + ' - ' + items['title'] + '\"'

os.system('dunstify -r 998 ' + title + ' ' + message)
os.system('polybar-msg -p $(pidof polybar) hook cmus 1')
os.system('pkill -SIGRTMIN+12 i3blocks')
