require "Win32API"
require 'Date'
require 'etc'
 
api = Win32API.new( 'user32', 'GetLastInputInfo', ['P'], 'I')
# match the structure LASTINPUTINFO. First 4 byte int is size of struct
s = [8, 0].pack('l*')
 
t = Win32API.new("kernel32", "GetTickCount", nil, 'L')
 
puts 'Idle Watcher by Andreas Wildi'
puts 'This programm logs the idle time'
username = Etc.getlogin
 
if defined?(Ocra)
	exit
end
 
while true do 
	api.call( s )
	a = s.unpack('l*')
	tickCount =  t.call()
 
	idleTimeMs = tickCount - a[1]
	sleep 300 # 300 = 5min
	line = DateTime.now.strftime("%m/%d/%Y %H:%M:%S") + ": User " + username + " idle for " + (idleTimeMs / 1000.0 / 60.0).round(2).to_s + ' Min'
	puts line
	File.open('c:\temp\idleLog.txt', 'a+') { |file| file.write(line + "\n") }
end