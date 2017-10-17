require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def get_the_email_of_a_townhal_from_its_webpage(url)

	page = Nokogiri::HTML(open(url))
	emails = page.css(".tr-last > td:nth-child(2)").each do |line|
		if line.text.include?("@")
			return line.text
		end
	end

	#binding.pry #que si tu as un pb, pas systématique
end

def get_all_the_urls_of_ardeche_townhalls(urls)

	bonus = {}   #déclarer un tableau
	page = Nokogiri::HTML(open(urls))
	page.xpath("//a[@class=\"lientxt\"]").each do |node|
		puts node.text
		bonus[node.text] = "http://annuaire-des-mairies.com/" + node[:href] #ajouter "nom" + node[:href] au tableau
		end 

	return bonus  #renvoyer le tableau
	
end

def listing(urls)
	listing = {}
	get_all_the_urls_of_ardeche_townhalls(urls).each do |key, value|
		listing[key]= get_the_email_of_a_townhal_from_its_webpage(value)
	end
	return listing
end
