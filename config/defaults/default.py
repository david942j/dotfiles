#!/usr/bin/env python2

from pwn import *
import sys
import os

host, port = '', 31337
local = False
if len(sys.argv) == 1:
  host = '127.0.0.1'
  local = True
r = remote(host, port)

context.arch = 'amd64'
#  context.log_level = 'debug'

r.interactive()
