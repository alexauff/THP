class Zombie

	attr_accessor :name 
	attr_accessor :age 

	def initialize(nom_zombie)
		@name = nom_zombie
	end

	def donner_age(age_zombie) #donner_age : fonction et (age_zombie) : argument (quand on appelle une fonction et qu'on y passe une valeur)
		@age = age_zombie
	end

end

mon_zombie = Zombie.new("Toto") #mon_zombie devient une instance de Zombie avec Zombie.new et "Toto" est la valeur de l'attribut nom
puts "#{mon_zombie.name} a #{mon_zombie.age} ans"

mon_zombie.donner_age(14)
puts "#{mon_zombie.name} a #{mon_zombie.age} ans"