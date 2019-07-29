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
			@life_points = 0
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

class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(name)
		@life_points = 100
		@weapon_level = 1
		@name = name
	end

	def show_state
		return " \n #{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level} \n"
	end

	def compute_damage
		rand(1..6) * @weapon_level
	end

	def search_weapon
		weapon_level1 = rand(1..6)
		if (@weapon_level < weapon_level1)
			@weapon_level = weapon_level1
			puts " \n Tu as une arme de niveau #{@weapon_level} \n"
		else
			puts " \n M@*#$... elle n'est pas mieux que ton arme actuelle... \n"
		end
	end

	def search_health_pack
		c = rand(1..6)
		case c
		when 1
			puts " \n Tu n'as rien trouvé... dommage :-( \n"
		when 2..5
			@life_points += 50
			if @life_points > 100
				@life_points = 100
			end
			puts "\n Bravo, tu as trouvé un pack de +50 points de vie \n"
		when 6
			@life_points += 80
			if @life_points > 100
				@life_points = 100
			end
			puts " \n Waow, tu as trouvé un pack de +80 points de vie \n"
		end
	end

end

puts "Fin de vie"