require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/"))   
puts page.class

doc.xpath('//h3/@').each do |node|  #Find all "@" tags with a parent tag whose name is "..."
	puts node.text
	end

binding.pry

puts page

