require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

page = Nokogiri::HTML(open("https://github.com/sparklemotion/nokogiri"))   
puts page.class

doc.xpath('//h3/a').each do |node|     #Find all "a" tags with a parent tag whose name is "h3"  : / (root of the tree) // separate the tag info
	  puts node.text
	end
