require 'pry' #indispensable pour appeler pry afin de tester le programme

guess_this_number = 20

print "Guess a number between 0 and 50:"
user_guess = gets.chomp

binding.pry #bloquer la suite du programme. 

if guess_this_number == user_guess
	puts 'Congratulations, you guessed the number!'
elsif guess_this_number > user_guess
	puts 'Too low, try again.'
else
	puts 'Too high, try again.'
end

#see video https://www.youtube.com/watch?v=dPDrgpWakrA