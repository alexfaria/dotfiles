#!/usr/bin/python

import imaplib
import sys
import json

file = sys.argv[1]

credentials = ''
with open(file, 'r') as f:
    data = json.load(f)

obj = imaplib.IMAP4_SSL(data['server'],data['port'])
obj.login(data['user'],data['password']) # write your email and password
obj.select()
n = len(obj.search(None, 'UnSeen')[1][0].split())
if n > 0:
    print(n)
# print(len(obj.search(None, 'UnSeen')[1][0].split()))
