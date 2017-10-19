require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def get_the_email_of_a_townhal_from_its_webpage(url)

	page = Nokogiri::HTML(open(url))
	emails = page.css(".Style22").each do |line|
		if line.text.include?("@")
			puts line.text
		end
	end
	#binding.pry #que si tu as un pb, pas systématique
end

def get_all_the_urls_of_val_doise_townhalls(urls)

	#déclarer un tableau
	bonus = []

	page = Nokogiri::HTML(open(urls))
	emails = page.xpath("//a[@class=\"lientxt\"]").each do |node|
		#puts node[:href]
		#ajouter "http://annuaire-des-mairies.com/" + node[:href] au tableau
		bonus << "http://annuaire-des-mairies.com/" + node[:href]
	end

	return bonus
	#renvoyer le tableau

	bonus.each do |townhall|
  puts node[:name].to_s + " (" + node[:email].to_s + ")"

end

end

urls = "http://annuaire-des-mairies.com/val-d-oise.html"
get_all_the_urls_of_val_doise_townhalls(urls).each do |townhall_url|
	get_the_email_of_a_townhal_from_its_webpage(townhall_url)
end

