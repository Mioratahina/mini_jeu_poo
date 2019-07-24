require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "	--------------------------------------------------"
puts "	|> > Bienvenue sur 'ILS VEULENT TOUS MA POO'! < <|"
puts "	| Le but du jeu est d'être le dernier survivant !|"
puts "	--------------------------------------------------"

print "Enter votre prénom : "
nom = gets.chomp
nom = HumanPlayer.new("#{nom}")
my_game = Game.new("#{nom}")
puts "\n Passons à la phase d'attaque : \n"

while my_game.is_still_ongoing? == true #(nom.life_points > 0 && @enemies.length > 0)
	puts "> > > Voici l'état de chaque joueur < < <"
	my_game.show_players
	my_game.menu
	my_game.menu_choice
	my_game.enemies_attacks
end
my_game.end

binding.pry