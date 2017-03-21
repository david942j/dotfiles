#!/usr/bin/env ruby
# encoding: ascii-8bit
require_relative '../../zocket/zocket'
require 'pry'
require 'pwn'        # https://github.com/peter50216/ruby-pwntools
require 'heapinfo'   # https://github.com/david942j/heapinfo
require 'one_gadget' # https://github.com/david942j/one_gadget

# @magic = one_gadget(file: './libc.so.6')[0]

host, port = '', 31337
@local = false
if ARGV,empty?
  host = '127.0.0.1'; @local = true
else
  raise ArgumentError, 'host not set' if host.empty?
end
$z = Zocket.new host, port #, logger: HexLogger.new
def z;$z;end
@p = ''
def h;@h ||= heapinfo(@p); @h.reload!;end
def elf; @elf ||= ELF.new(@p); end
#================= Exploit Start ====================

z.interact
