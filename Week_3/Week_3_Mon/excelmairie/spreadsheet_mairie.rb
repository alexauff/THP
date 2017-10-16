require "google_drive"
require_relative "retrievetownhalls"

# Creates a session. This will prompt the credential via command line for the
# first time and save it to config.json file for later usages.
# See this document to learn how to create config.json:
# https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md
session = GoogleDrive::Session.from_config("config.json")

setup_spreadsheet = session.create_spreadsheet("mairies")

worksheet.insert_rows(1, [["Ville", "Adresse email"]])
worksheet.save

#créer une def qui récupère les emails et noms scrappés

def get_the_hash_that_I_scrapped_few_days_ago()
	page_url = "http://annuaire-des-mairies.com/val-d-oise.html"
	return townhalls_info 
end

tab= get_the_hash_that_I_scrapped_few_days_ago()

#je me positionne dans le 1er worksheet
worksheet = setup_spreadsheet.worksheets.first
worksheet.save

def get_the_name_and_put_it_in_spreadsheet ()