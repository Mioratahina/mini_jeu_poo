require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

puts "	--------------------------------------------------"
puts "	|> > Bienvenue sur 'ILS VEULENT TOUS MA POO'! < <|"
puts "	| Le but du jeu est d'être le dernier survivant !|"
puts "	--------------------------------------------------"
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

	puts "Quelle action veux-tu éffectuer ?"
	puts " a - si tu veux chercher une meilleure arme, press a"
	puts " s - si tu veux chercher à se soigner, press s"
	choice1 = gets.chomp
	if choice1 == "a"
		puts nom.search_weapon
	elsif choice1 == "s"
		puts nom.search_health_pack
	else
		puts "choix invalidé, choisir à nouveau :"
		choice1 = gets.chomp
	end

	puts "Attaquer un joueur en vue : "
	puts " 0 - #{player1.show_state}, si tu veux l'attaquer, press 0 :"
	puts " 1 - #{player2.show_state}, si tu veux l'attaquer, press 1 :"
	choice2 = Integer(gets.chomp)
	if (choice2 == 0)
		nom.attacks(player1)
	end
	if (choice2 == 1)
		nom.attacks(player2)
	end
	enemies.each do |i|
		if (i.life_points > 0)
			i.attacks(nom)
		end
	end
end

puts "La partie est terminée"
if (nom.life_points > 0) 
	puts "BRAVO ! TU AS GAGNE !"
else
	puts "LOSER ! TU AS PERDU !"
end

