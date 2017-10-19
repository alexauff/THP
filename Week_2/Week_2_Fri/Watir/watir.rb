require 'watir'

browser = Watir::Browser.new(:chrome)
browser.goto 'google.com'

search_bar = browser.text_field(class:'gsfi')

#en simulant appui sur touche entrée
search_bar.send_keys(:enter)

#en simulant appui sur loupe de google
submit_button = browser.button(type:"submit")
submit_button.click