#!/usr/bin/env python3

import requests

r = requests.get('http://api.fixer.io/latest');
ticker = r.json()

print('%.4f' % float(ticker['rates']['GBP']))
