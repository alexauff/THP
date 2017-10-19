require "pry"

# class User    #class

# def initialize(firstname, lastname)
#     puts "I'm a new User named #{firstname} #{lastname}"
#   end

# 	def set_name_to(some_string)
# 		@name = some_string
# 	end

# 	def get_name
# 		return @name
# 	end

# 	def greet
# 		puts "Hi! My name is #{@name}"
# 	end

# end

# binding.pry

# puts "end of file"

# alice = User.new    #instance
# alice.set_name_to("alice")
# puts alice.get_name

# madhatter = User.new
# madhatter.set_name_to("Mad Hatter")
# puts madhatter.get_name

# alice.greet
# madhatter.greet

#FULLNAME
class User

  def initialize(firstname, lastname)
    @firstname = firstname
    @lastname = lastname
  end

  def full_name
    return "#{@firstname.capitalize} #{@lastname.capitalize}"
  end

  harry = User.new("Harry", "Potter")
  harry.full_name

  puts harry.full_name

end

#COUNT
class User
  attr_accessor :firstname, :lastname
  @@all = 0

  def count
    return @@all
  end

  def initialize(firstname, lastname)
    @firstname = firstname
    @lastname = lastname
    @@all += 1
  end

  def full_name
    return "#{@firstname.capitalize} #{@lastname.capitalize}"
  end
end

harry = User.new("Harry", "Potter")
harry.count
# => 1
ron = User.new("Ron", "Weasley")
harry.count
# => 2
ron.count
# => 2
draco = User.new("Draco", "Malfoy")
harry.count
# => 3
ron.count
# => 3
draco.count
# => 3