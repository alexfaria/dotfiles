#!/usr/bin/python

import sys, os, re

p = re.compile(r'(status)|(file)|(artist)|(album)|(tracknumber)|(title)|(date)|(duration)')

# with open('workfile', 'w+') as f:
#     f.write(' '.join(sys.argv[1:]))

dic = list(filter(None, p.split(' '.join(sys.argv[1:]))))

items = {'status': dic[1].strip(), 'file': dic[3].strip(), 'tracknumber': dic[9].strip(), 'artist': dic[5].strip(), 'album': dic[7].strip(), 'title': dic[11].strip(), 'date': dic[13].strip(), 'duration': dic[15].strip()}

title = "\"Stopped Playing\""
message = ""

if items['status'] == 'playing':
    title = "\"Playing\""
    message = '\"' + items['artist'] + ' - ' + items['title'] + '\"'

if items['status'] == 'paused':
    title = "\"Paused\""
    message = '\"' + items['artist'] + ' - ' + items['title'] + '\"'

os.system('dunstify -r 998 ' + title + ' ' + message)
os.system('pkill -SIGRTMIN+12 i3blocks')
