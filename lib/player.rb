require 'pry'

class Player
	attr_accessor :name, :life_points, :hit

	def initialize(name)
		@name = name
		@life_points = 10
	end

	def show_state
		return " #{@name} a #{@life_points} points de vie \n"
	end

	def gets_damage(hit)
		@life_points -= hit
		if @life_points <= 0
			return "\n * * * le joueur #{@name} a été tué ! * * * "
		end
	end

	def compute_damage
    return rand(1..6)
  end

  def attacks(other_player)
  	variable = compute_damage
  	puts "\n #{@name} attaque #{other_player.name} \n"
  	puts " il lui inflige #{variable} points de damage"
   	puts other_player.gets_damage(variable)
	end

end

puts "Fin de vie"