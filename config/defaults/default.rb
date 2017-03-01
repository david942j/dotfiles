#!/usr/bin/env ruby
# encoding: ascii-8bit
require_relative '../../zocket/zocket'
require 'pwn'      # https://github.com/peter50216/ruby-pwntools
require 'heapinfo' # https://github.com/david942j/heapinfo
require 'one_gadget' # https://github.com/david942j/one_gadget

# @magic = one_gadget(file: './libc.so.6')

HOST, PORT = '', 31337
@local = false
(HOST = '127.0.0.1'; @local = true) if ARGV.empty?
$z = Zocket.new HOST, PORT #, logger: HexLogger.new
def z;$z;end
$h = heapinfo('')
def h;$h;end
#================= Exploit Start ====================

z.interact
