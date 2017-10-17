require "gmail"
require "google_drive" #infos déjà sur google drive donc on require google drive

def get_the_email_html
  file = {}
#créer la session avec les keys et id clients dans le .json
session = GoogleDrive::Session.from_config("client_secret.json")
my_spreadsheet = session.spreadsheet_by_title ("thpardeche")

#je me positionne dans le worksheet
first_worksheet = my_spreadsheet.worksheets[0]
first_worksheet.title = "Contacts"

#récupère les infos du google drive
(1..first_worksheet.num_rows).each do |row|
file[first_worksheet[row,1]] = first_worksheet[row,2]
  return file
  end
end

#envoyer un email methode 1
def send_email_to_line(name_townhall,email)
  #se connecter au comptes
gmail = Gmail.connect("auffalex@gmail.com", "hackingproject");

gmail.deliver do

#à la liste d'emails contenus dans la colonne du google drive
  to email
  subject "Les habitants de #{name_townhall} veulent apprendre à coder ?"
  text_part do
    body "Bonjour,
Je m'appelle Alexandra, je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau. La formation s'appelle The Hacking Project (http://thehackingproject.org/). Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes. Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.
Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à {townhall_name}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées. Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec {townhall_name} !
Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"
            end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body "<p>Bonjour,</p>
    
<p>Je m'appelle Alexandra, je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau.</p>
<p>La formation s'appelle <strong>The Hacking Project</strong> (http://thehackingproject.org/). Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes.</p>
<p>Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de <strong>The Hacking Project</strong> un nouveau format d'éducation gratuite.
Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à <em>#{name_townhall}</em>, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées.
Le modèle d'éducation de <strong>The Hacking Project</strong> n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec <em>#{name_townhall}</em>!</p>

<p><em>Charles</em>, co-fondateur de <strong>The Hacking Project</strong> pourra répondre à toutes vos questions : 06.95.46.60.80</p>
<p>À très vite pour coder ensemble !</p>"

            end
  add_file "thp.jpg"
  reply_to"charles@thehackingproject.org"
  end
end

get_the_email_html.each do |name_townhall,email|
send_email_to_line(name_townhall,email)
  end
