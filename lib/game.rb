require 'pry'

class Game
	attr_accessor :human_player, :enemies

	def initialize(human_player)
		@human_player = human_player
		player1 = Player.new("Josiane")
		player2 = Player.new("José")
		player3 = Player.new("Joseph")
		player4 = Player.new("Judi")
		@enemies = [player1, player2, player3, player4]
	end

	def kill_player
		@enemies.each do |j|
			if (j.life_points <= 0)
				@enemies.delete(j)
			end
		end
	end

	def is_still_ongoing?
		if ((@human_player.life_points > 0) && (@enemies[0].life_points > 0 || @enemies[1].life_points > 0 || @enemies[2].life_points > 0 || @enemies[3].life_points > 0)
			return true
		else
			return false
		end
	end

	def show_players
		puts human_player.show_state
		kill_player
		@enemies.each do |l|
			puts "les enemies restant sont : #{@enemies[l]} "
		end
	end

	def menu
		puts "Quelle action veux-tu éffectuer?
						a - chercher une meilleure arme
						s - chercher à se soigner \n"
		puts "Attaquer un joueur en vue :"
		kill_player
		@enemies.each do |count|
			puts "	#{count} - #{count.show_state}"
		end
	end

	def menu_choice
		puts "Entrer votre choix : "
		choice = gets.chomp
		case choice
		when "a"
			puts human_player.search_weapon
		when "s"
			puts human_player.search_health_pack
		when "0"
			human_player.attacks(player1)
		when "1"
			human_player.attacks(player2)
		when "2"
			human_player.attacks(player3)
		when "3"
			human_player.attacks(player4)
		else
			puts "choix invalidé, choisir à nouveau :"
			choice = gets.chomp
		end
	end

	def enemies_attack
		@enemies.each do |c|
			c.attacks(human_player)
		end
	end

	def end
		puts "La partie est terminée"
		if (@human_player.life_points > 0) 
			puts "BRAVO ! TU AS GAGNE !"
		else
			puts "LOSER ! TU AS PERDU !"
		end
	end

end