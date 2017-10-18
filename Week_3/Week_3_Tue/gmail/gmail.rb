require "gmail"

#se connecter au compte
gmail = Gmail.connect("auffalex@gmail.com", "hackingproject");

#compter le nombre de mails lus
gmail.inbox.count(:read)
puts gmail.inbox.count(:read)

#compter le nombre de mails non lus
gmail.inbox.count(:unread)
puts gmail.inbox.count(:unread)

#compter le nombre de mails reçus de l'adresse suivante
gmail.inbox.count(:from => "alexandra.auffray@gmail.com")
puts gmail.inbox.count(:from => "alexandra.auffray@gmail.com")

#compter le nombre de mails envoyés à l'adresse suivante
gmail.inbox.count(:to => "alexandra.auffray@gmail.com")
puts gmail.inbox.count(:to => "alexandra.auffray@gmail.com")

#afficher la liste des dossiers dans gmail
gmail.labels.all
puts gmail.labels.all

#créer un nouveau dossier
gmail.labels.new("Urgent")

#supprimer un dossier
gmail.labels.delete("Urgent")

#vérifier si un dossier existe
gmail.labels.exists?("Urgent")
puts gmail.labels.exists?("Urgent")

#envoyer un email methode 1
gmail.deliver do
  to "micheleauffray92@gmail.com"
  subject "Mams, je t'envoie un email en direct de mon terminal Ruby(code)"
  text_part do
    body "Love you"
  end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body "<p>Love you</p>"
  end
  add_file "download.png"
end

#envoyer un email methode 2
# email = gmail.compose do
#   to "auffalex@gmail.com"
#   subject "Having fun in Puerto Rico!"
#   body "Spent the day on the road..."
# end
# email.deliver!
