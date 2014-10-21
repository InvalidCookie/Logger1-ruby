#!/usr/bin/env ruby
puts "version 0.1"

if_file = File.file?("data.txt")
if if_file == false
	puts 'data file not found.'
	puts 'creating data file...'
	File.new("data.txt", 'w+')
	puts'data file created!'
else
	puts 'data file found...'
end

file_zero = File.zero?("data.txt")
if file_zero == true
	@data = []
	puts 'default array made'
else
	@data = []
	@list = []
	f = File.open("data.txt", "r")
	f.each_line do |line|
     @list.push line
  end
	puts 'data file loaded!'
end

date = Time.new
puts 'date added to variable'

while true
	puts ""
	puts "What would you like to do?"
	puts "List - list items in the log"
	puts "Add - add an item to the log"
	puts "Sort - sorts by date"
	puts "Date - View date"
	puts "  Cdate - Change date"
	puts "    Cyear - change the year"
	puts "    Cmonth - change the month"
	puts "    Cday - change the day"
	puts "  Rdate - Reset date to todays date"
	puts "Exit - to exit"
	choice = gets.chomp.downcase
	case choice
	when "add"
		puts ""
		puts "Name of media"
		name = gets.chomp
		puts "Type of media"
		type = gets.chomp
		puts "Minutes watched"
		minutes = gets.chomp
		named = "Name: #{name}"
		media = "Media: #{type}"
		timew = "Minutes watched: #{minutes}"
		puts ""	
		@data.push( "", date.strftime("%x"), named, media, timew )
		puts 'Dumping...'
		open('data.txt', 'a') do |f|
  		f.puts @data
		end
		puts 'Dump successful!'
		@list = []
		f = File.open("data.txt", "r")
		f.each_line do |line|
      @list.push line
  	end
  	puts "Reloaded file"
	when "list"
		puts @list
	when 'exit'
		Process.exit
	when 'date'
		puts date.strftime("%x")
	when 'cdate'
		puts "Year"
		year = gets.chomp
		puts "Month"
		month = gets.chomp
		puts "Day"
		day = gets.chomp
		date = Time.new(year, month, day)
		puts "Date changed successful"
	when 'cyear'
		puts "Year"
		year = gets.chomp
		month = date.strftime("%m")
		day = date.strftime("%d")
		date = Time.new(year, month, day)
	when 'cmonth'
		puts "Month"
		month = gets.chomp
		year = date.strftime("%y")
		day = date.strftime("%d")
		date = Time.new(year, month, day)
	when 'cday'
		puts "Day"
		day = gets.chomp
		month = date.strftime("%m")
		year = date.strftime("%y")
		date = Time.new(year, month, day)
	when "rdate"
		date = Time.new
		puts "Date reset"
	when 'sort'
		puts 'not implimented yet, may never be'
	else
		puts "invalid cookie"
	end
end