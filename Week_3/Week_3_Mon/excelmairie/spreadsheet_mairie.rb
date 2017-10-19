require "google_drive"
require_relative "scrapping.rb"

#créer la session avec les keys et id clients dans le .json
session = GoogleDrive::Session.from_config("config.json")

#créer le spreadsheet
setup_spreadsheet = session.spreadsheet_by_title("mairies")

#pour éviter qu'il s'affiche plusieurs fois
if setup_spreadsheet.nil?
	setup_spreadsheet = session.create_spreadsheet("mairies")
end

#je me positionne dans le 1er worksheet que je renomme 
worksheet = setup_spreadsheet.worksheets.first
worksheet.title = "Contacts"

#pour insérer les titres des colonnes
worksheet.insert_rows(1, [["Ville", "Adresse email"]])
worksheet.save

#créer une def qui récupère les emails et noms scrappés
def get_the_hash_that_I_scrapped_few_days_ago()
	page_url = "http://annuaire-des-mairies.com/val-d-oise.html"
	
#appel de la fonction contenue dans le fichier route mairie, autre repertoire, via le require_relative du debut de ce fichier
	return townhalls_info 
end

# #tab est un tableau car la fonction de scrapp retourne un tableau de hashs
#
tab= get_the_hash_that_I_scrapped_few_days_ago()

def get_the_name_and_email_and_put_it_in_spreadsheet(fichier_mairie, tab)
	#je me positionne dans le 1er onglet de mon fichier spreadsheet drive (excel drive)
	#onglet1 = fichier_mairie.worksheets.first
	onglet1 = fichier_mairie.worksheets[0]

	#notre tableau de hash de nom mairie , email = tab
	# tab[15]
	# => {:name=>"BEAUCHAMP",
	#  :email=>"accueil-mairie@ville-beauchamp.fr"}

	# on demarre
	# i à 2 car la 1ere ligne est la ligne qui contient les noms de colonne , i va de 2 à taille du tableau de hash soit 185+2=187
	i=2
	#binding.pry
	tab.each do |element_du_tab_est_hash|
		onglet1[i,1] = element_du_tab_est_hash[:name]

		onglet1[i,2] = element_du_tab_est_hash[:email]

		#incrementation des lignes "i" en dehors des boucles d'insertion des valeurs
		i += 1
	end

	onglet1.save
end

#utilisation de la fonction
get_the_name_and_email_and_put_it_in_spreadsheet(fichier_mairie , tab)

#enregistrer le worksheet
worksheet.save

#conserver données
tab = {"name", "email"};
config.json = JSON.stringify(myObj);
localStorage.setItem("testJSON", myJSON);