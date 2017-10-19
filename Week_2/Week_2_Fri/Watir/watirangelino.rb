require 'watir'
browser = Watir::Browser.new(:firefox)
browser.goto 'google.com'

search_bar = browser.text_field(class: 'gsfi')
search_bar.set("Hello World!")
browser.screenshot.save 'lol.png'

#méthode de la barre d'entrée
search_bar.send_keys(:enter)

#méthode du clic
#submit_button = browser.button(type:"submit")
#submit_button.click

#petit timer de la vie pépére
browser.driver.manage.timeouts.implicit_wait = 3

#récupère le contenu de h3 et hashage
#search_result_divs = browser.divs(class:"rc")
#search_result_divs.each { |div| p div.h3.text } 

#blague by Félix
p "Méfait accompli, fermeture du browser"
browser.close
1 commentaire