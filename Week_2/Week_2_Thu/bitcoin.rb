require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def currencies(price)

	#definir tableau vide
	array = []
	page = Nokogiri::HTML(open(price))
	prices = page.xpath("//a[@class=\"price\"]").each do |node|
		
		#ajouter au tableau un hash {clé_1: node href, clé_2: node.text}
		array << {name: node[:href], price: node.text}
		href.split[2]
	end
	#return tablr
	return array

end

price = "https://coinmarketcap.com/all/views/all/"
currencies(price).each do |currency|
puts currency[:name] + " " + currency[:price]
end 