class Monkey   

attr_accessor :name, :species, :foods_eaten

	def initialize(shortname, species)
		@name = shortname.capitalize
		@species = species
		@foods_eaten = []
	end

	def eat(food)
			if food.start_with?("a","e","i","o","u","y")
				@foods_eaten = []
			else
			@foods_eaten << food 
			end
	end

	def introduce()
		return "I'm a monkey named #{@name} from the species #{@species} who loves #{@foods_eaten}"
	end

end