#!/bin/python
import requests
import urllib.request
import os.path

pictures_dir = '/home/alex/Pictures/nasa'
api_key = "DEMO_KEY"

print("Making a request")
r = requests.get("https://api.nasa.gov/planetary/apod?api_key=" + api_key)
apod = r.json()

filename = apod['date'].replace('-', '') + '_apod.jpg'
filename = os.path.join(pictures_dir, filename)
exist = os.path.exists(filename)

if not exist:
    print("File does not exist, getting it and setting it as the background")
    image = urllib.request.urlretrieve(apod['url'], filename)
    os.system("/usr/sbin/gsettings set org.gnome.desktop.background picture-uri file:///" + filename)
else:
    print("File already exists, skipping")
