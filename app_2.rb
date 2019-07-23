require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

puts "--------------------------------------------------"
puts "|> > Bienvenue sur 'ILS VEULENT TOUS MA POO'! < <|"
puts "| Le but du jeu est d'être le dernier survivant !|"
puts "--------------------------------------------------"
print "Enter votre prénom : "
nom = gets.chomp
nom = HumanPlayer.new("#{nom}")
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1, player2]
puts "\n Passons à la phase d'attaque : \n"

while (nom.life_points > 0) && (player1.life_points > 0 || player2.life_points >0)
	puts "> > > Voici l'état de chaque joueur < < <"
	puts player1.show_state
	puts player2.show_state
	puts nom.show_state

	for i in 0...enemies.length
		nom.attacks(enemies[i].to_s)
		if i == enemies.length-1
			if (enemies[i].life_points <= 0)
				break
			end
		end
		enemies[i].attacks(nom)
		if (nom.life_points <= 0)
			break
		end
end

puts "La parite est terminée"
if (nom.life_points > 0) 
	puts "BRAVO ! TU AS GAGNE !"
else
	puts "LOSER ! TU AS PERDU !"
end
end