require 'bundler'
Bundler.require
 
# Authenticate a session with your Service Account
session = GoogleDrive::Session.from_service_account_key("client_secret.json")
 
# Get the spreadsheet by its title
spreadsheet = session.spreadsheet_by_title("Copie de Legislators 2017")
# Get the first worksheet
worksheet = spreadsheet.worksheets.first
# Print out the first 6 columns of each row
worksheet.rows.each { |row| puts row.first(6).join(" | ") }

#The insert_rows method inserts new rows above the row number you supply. 
#This will insert a single row above the first row of data.
#worksheet.insert_rows(2, [["Hello!", "This", "was", "inserted", "via", "Ruby"]])
#worksheet.save

#worksheet.insert_rows(worksheet.num_rows + 1, [["Hello!", "This", "was", "inserted", "at", "the", "bottom"]])
#worksheet.save

#Apporter une modif à une cellule en donnant le numéro de la ligne et de la colonne
#worksheet[2, 1] = "Updated!"
#worksheet.save

#Apporter une modif à une cellule en donnant le numero de case
#worksheet["A2"] = "Updated again!"
#worksheet.save

#Supprimer une ligne
worksheet.delete_rows(2, 1)
worksheet.save