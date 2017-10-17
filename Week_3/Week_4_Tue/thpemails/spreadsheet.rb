require "google_drive"
require_relative "scrapping.rb"

#créer la session avec les keys et id clients dans le .json
session = GoogleDrive::Session.from_config("client_secret.json")

#créer le spreadsheet
my_spreadsheet = session.spreadsheet_by_title("thpardeche")

#pour éviter qu'il s'affiche plusieurs fois
if my_spreadsheet.nil?
	my_spreadsheet = session.create_spreadsheet("thpardeche")
end

#je me positionne dans le 1er worksheet que je renomme 
first_worksheet = my_spreadsheet.worksheets[0]
first_worksheet.title = "Contacts"
first_worksheet.save

#récupérer la fonction scrapping à partir des 2 urls page 1 et page 2
i = 1
emailing = listing("http://annuaire-des-mairies.com/ardeche.html")
emailing.each do |name_townhall, email|
	first_worksheet[i,1] = name_townhall
	first_worksheet[i,2] = email
	i += 1
end

emailing2 = listing("http://annuaire-des-mairies.com/ardeche-2.html")
emailing2.each do |name_townhall, email|
	first_worksheet[i,1] = name_townhall
	first_worksheet[i,2] = email
	i += 1
end 

#enregistrer travail
first_worksheet.save


