#!/usr/bin/env ruby
# encoding: ascii-8bit
require_relative '../../zocket/zocket'
require 'pry'
require 'pwn'      # https://github.com/peter50216/ruby-pwntools
require 'heapinfo' # https://github.com/david942j/heapinfo
require 'one_gadget' # https://github.com/david942j/one_gadget

# @magic = one_gadget(file: './libc.so.6')

host, port = '', 31337
@local = false
(host = '127.0.0.1'; @local = true) if ARGV.empty?
$z = Zocket.new host, port #, logger: HexLogger.new
def z;$z;end
$h = heapinfo('')
def h;$h.reload!;end
#================= Exploit Start ====================

z.interact
