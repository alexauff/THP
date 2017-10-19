require "pry"

class BoardCase
  #TO DO : la classe a 2 attr_accessor, sa valeur (X, O, ou vide), ainsi que son numéro de case)
    attr_accessor :value, :number
  
  def initialize(value, number)
    #TO DO doit régler sa valeur, ainsi que son numéro de case
      @value = value
      @number= number
  end
  
  def to_s
    #TO DO : doit renvoyer la valeur au format string
    return @value = value.to_s
    return @number = number.to_s
  end
end

binding.pry

class Board
  include Enumerable
  #TO DO : la classe a 1 attr_accessor, une array qui contient les BoardCases
  attr_accessor :array            

  def initialize 
    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans une array qui est l'attr_accessor de la classe
    @array = []
    (1..9).each do |i|
      @array << BoardCase.new("", i)
      end
  end

  def to_s
  #TO DO : afficher le plateau
      print " 1 | 2 | 3 ",
            " 4 | 5 | 6 ",
            " 7 | 8 | 9 "
      print "\n"
      return @array.to_s
  end

  def play
    #TO DO : une méthode qui change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
    if @value == "X" 
      puts BoardCase "X"
    elsif @value == "O" 
      puts BoardCase "O"
    else 
      puts BoardCase
    end
  end

  # def victory?
  #   #TO DO : qui gagne ?
  #     @winning = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [3, 5, 7], [1, 5, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9]]
  #     if player1.value == winning 
  #       puts "#{name1} gagne la partie !"
  #     elsif player2.value.include?.winning
  #       puts "#{name2} gagne la partie !"
  #     else 
  #       puts "Match nul !"
  #     end
  # end
end

class Player
  #TO DO : la classe a 2 attr_accessor, son nom, sa valeur (X ou O). Elle a un attr_writer : il a gagné ?
attr_accessor :name, :value
attr_writer :state
  
  def initialize(name, value, state)
    #TO DO : doit régler son nom, sa valeur, son état de victoire
    @name = name
    @value = value
    @state = state
  end
end

class Game
  def initialize
    #TO DO : créé 2 joueurs, créé un board

    puts "Quel est ton nom?"
    name1 = gets.chomp
    puts "Et celui de ton adversaire?"
    name2 = gets.chomp
    
    player1 = Player.new(name1, "X", "")
    player2 = Player.new(name2, "O", "")

  end

  def go
    # TO DO : lance la partie
    puts "Bienvenue au Morpion. Appuie n'importe où pour commencer."
            puts ""
            @@input = gets.chomp

    start = Board.new

  end

  def turn
    #TO DO : affiche le plateau, demande au joueur il joue quoi, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie
    puts " 1 | 2 | 3 ",
         " 4 | 5 | 6 ",
         " 7 | 8 | 9 "
    print "\n"
    puts "choisis une case"
    @number = gets.chomp

    if player1.value == winning 
        puts "#{name1} gagne la partie !"
      elsif player2.value.include?.winning
        puts "#{name2} gagne la partie !"
      else
        puts "Match nul !"
    end
  end

end

Game.new.go