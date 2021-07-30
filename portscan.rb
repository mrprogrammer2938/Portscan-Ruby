#!/usr/bin/ruby
# This Programm Write by Mr.nope
# PortScan-Ruby v1.3.0
=begin
MIT License

Copyright (c) 2021 Mr.Programmer2938

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
=end
require 'socket'
banner = """\033[92m
PPPPPP                tt        SSSSS                         
PP   PP  oooo  rr rr  tt       SS        cccc   aa aa nn nnn  
PPPPPP  oo  oo rrr  r tttt      SSSSS  cc      aa aaa nnn  nn 
PP      oo  oo rr     tt            SS cc     aa  aaa nn   nn 
PP       oooo  rr      tttt     SSSSS   ccccc  aaa aa nn   nn 
                                                              \033[0m\n"""
system("printf '\033]2;Inp\a'")
system("clear")
print banner
print "\nEnter host: "
host = gets.chomp
sleep(1)
print "\nEnter port: "
port = gets.chomp.to_i
sleep(1)
HOST = ARGV[1] || host
PORT = ARGV[0] || port
def main(banner)
    system("printf '\033]2;PortScan\a'")
    system("clear")
    print banner
    puts "{1}.Start Scanning"
    puts "{2}.Exit"
    print "\n\033[92mPortScan/> \033[0m"
    choose = gets.chomp
    if choose == '1'
        portscan()
    elsif choose == '2'
        ext()
    elsif choose == '' or choose == ' '
        main()
    else
        system("clear")
        puts "#{choose} \033[91mNot Found!\033[0m"
        try1()
    end
end  
def try1()
    print "\npress Enter..."
    try_to_menu = gets.chomp
    if try_to_menu == ''
        main()
    else
        main()
    end
end
def ext()
    system("clear")
    puts "Exiting..."
    exit
end
def portscan()
    begin
      socket = TCPSocket.new(HOST, PORT)
      stat = "open"
    rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
        stat = "Filter"
    end
    puts "\nPort: #{PORT} #{stat}"
    sleep(1)
    try2()
end
def try2()
    print "\nDo you want to try again? [y/n] "
    try_again_2 = gets.chomp
    if try_again_2 == 'y'
        system("ruby portscan.rb")
    elsif try_again_2 == 'n'
        try4()
    else
        try2()
    end
end
def try4()
    print "\npress Enter..."
    try_to_exit = gets.chomp
    if try_to_exit == ''
        ext()
    else
        ext()
    end
end
begin
    begin
        main(banner)
    rescue NoMethodError
        puts "\nCtrl + D"
        puts "\nExiting..."
        exit
    end
rescue Interrupt
    puts "\nCtrl + C"
    puts "\nExiting..."
    exit
end