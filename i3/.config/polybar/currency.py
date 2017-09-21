#!/usr/bin/env python3

import requests

# r = requests.get('http://api.fixer.io/latest');
r = requests.get('http://api.fixer.io/latest?base=GBP');
ticker = r.json()

print('%.4f' % float(ticker['rates']['EUR']))
