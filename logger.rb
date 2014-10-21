#!/usr/bin/env ruby
require 'YAML'
puts "version 0.1"
if_file = File.file?("data.yml")
if if_file == false
	puts 'data file not found.'
	puts 'creating data file...'
	File.new("data.yml", 'w+')
	puts'data file created!'
else
	puts 'data file found...'
end
file_zero = File.zero?("data.yml")
if file_zero == true
	@data = {["01/01/01".to_sym] => ["title".to_sym, "type".to_sym, 5.to_i]}
	puts 'default array made'
else
	@data = YAML::load(File.read('data.yml'))
	puts 'data file loaded!'
end

@date = Time.new
puts 'date added to variable'


def add
	puts "Whats the title? (type 'back' to go back)"
	title = gets.chomp
	if title == "back"
		main
	end
	puts "What was the purpose? (Entertainment, educational, etc)"
	type = gets.chomp
	puts "Minutes watched"
	minutes = gets.chomp
	@data[@date.strftime("%x").to_sym] = [title.to_sym, type.to_sym, minutes.to_i]

	puts 'Dumping...'
	File.write('data.yml', YAML.dump(@data))
	puts 'Dump successful!'
end

def list
	puts @data
end

def sort
	puts "not implimented yet"
end

def date
	puts @date.strftime("%x")
end

def cdate
	puts "Year"
	year = gets.chomp
	puts "Month"
	month = gets.chomp
	puts "Day"
	day = gets.chomp
	@date = Time.new(year, month, day)
	puts "@date changed successful"
end

def cyear
	puts "Year"
	year = gets.chomp
	month = @date.strftime("%m")
	day = @date.strftime("%d")
	@date = Time.new(year, month, day)
end

def cmonth
	puts "Month"
	month = gets.chomp
	year = @date.strftime("%y")
	day = @date.strftime("%d")
	@date = Time.new(year, month, day)
end

def cday
	puts "Day"
	day = gets.chomp
	month = @date.strftime("%m")
	year = @date.strftime("%y")
	@date = Time.new(year, month, day)
end

def rdate
	@date = Date.new
end

def exit
	Process.exit
end

def main
	while true
	puts ""
	puts "What would you like to do?"
	puts "Add - add an item to the log"
	puts "List - list items in the log"
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
			add
		when "list"
			list
		when "sort"
			sort
		when "date"
			date
		when "cdate"
			cdate
		when "cyear"
			cyear
		when "cmonth"
			cmonth
		when "cday"
			cday
		when "rdate"
			rdate
		when "exit"
			exit
		else
			puts "Error, Invalid cookie"
		end
	end
end

main()

#delete and change commands



=begin

while true
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
		@data.push( "", @date.strftime("%x"), named, media, timew )
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


=end