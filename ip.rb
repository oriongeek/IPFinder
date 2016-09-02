#!/usr/bin/ruby -w

begin
require 'nokogiri'
require 'open-uri'
require 'rainbow/ext/string'
rescue LoadError => e
p e
exit
end

def gems
foo = ARGV[0]
if (foo == "gem") then
   puts "\n\nINSTALLING REQUIRED GEMS, this may take time\n"
`xterm -e 'sudo gem install colorize nokogiri open-uri -V'`
puts "GEMS INSTALLED RESTART SCRIPT\n".color(:red)
else
  tracer
end
end

 def tracer
puts <<PRINT
\t\t
  _____ _____    _______                      
 |_   _|  __ \  |__   __|                     
   | | | |__) |    | |_ __ __ _  ___ ___ _ __ 
   | | |  ___/     | | '__/ _` |/ __/ _ \ '__|
  _| |_| |         | | | | (_| | (_|  __/ |   
 |_____|_|         |_|_|  \__,_|\___\___|_|   
 
 \t\t\t\t\ BY ORION G33KS\n\n
PRINT


puts "\n\nEnter the IP to Locate".color(:red)
ip = gets.chomp
puts "\e[H\e[2J"
puts "\nFETCHING DATA PLEASE WAIT...\n\n".color(:green).blink

url = "http://www.ip2location.com/#{ip}"
a = Nokogiri::HTML(open(url))
data = a.css('tr').text
if (data!="") then
puts "\t\t\t\t\t#{data}\t\t\t\t\t".color(:blue)
else
puts "NOT FOUND".color(:red).blink
puts "Open #{ip} iplocation.net in browser? (y/n)".color(:green)
rep = gets.chomp
if rep == 'y' then
`xdg-open 'http://iplocation.net'`
else
puts "BYE\n"
end
end
 end

gems
