#!/usr/bin/env python3

import sys
import base64

with open(sys.argv[1], "rb") as fp:
    base64_data = base64.b64encode(fp.read())
    print(f'data:image/jpg;base64,{base64_data.decode()}')
