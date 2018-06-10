require 'io/console'
require './Game'

player = Player.new
game = Game.new player
player.currentSector = game.sectors[0]

# set name
while player.nameSet == false && game.running == false
	printf "What is your name?\n"
	player.name = gets.chomp
	printf "\nYour name is %s, is this right? [y/n]\n", player.name
	if STDIN.getch == 'y' then
		player.nameSet = true
		game.running = true
		printf "\nWelcome %s!\n", player.name
	end
	printf "\n"
end

while game.running
	input = gets.chomp.split
	
	# Exit/Quit
	if input[0] == "exit" || input[0] == "quit" then
		game.exit
	end

	# Inventory
	if input[0] == "i" || input[0] == "inv" || input[0] == "inventory" then
		player.showInventory
	end

	# Map
	if input[0] == "m" || input[0] == "map" then
		game.showMap
	end

	# Doors
	if input[0] == "doors" then
		game.showDoorsFor player.currentSector
	end

	# Goto
	if input[0] == "goto" then
		player.goto input[1], game.sectors
	end

	# Build
	if input[0] == "build" then
		if input[1] == "item" then
			if input[2] && input[3] then
				printf "\nName can't contain white spaces!\n\n"
			elsif input[2] && input[2].delete(' ') != "" then
				item = Item.new input[2]
				printf "\nYou created an item called %s\n\n", item.name
				player.addItemToInventory item
				printf "\n%s added to your inventory\n\n", item.name
			else
				printf "\nbuild item <name>\n\n"
			end
		elsif input[1] == "sector" then
			printf "\nYou created a sector\n\n"
		else
			printf "\nbuild <item|sector> <name>\n\n"
		end
	end

	# Take
	if input[0] == "take" then
		player.take input[1]
	end

	# Where am I
	if input[0] == "wai" || input[0] == "whereami" then
		printf "\nYou are in sector %s\n\n", player.currentSector.name
	end

	# Drop
	if input[0] == "drop" then
		player.drop input[1]
	end

	# Give
	if input[0] == "give" then
		player.give input[1]
	end

	# Destroy
	if input[0] == "destroy" then
		player.destroy input[1]
	end

	# Objects
	if input[0] == "o" || input[0] == "objs" || input[0] == "objects" then
		game.showObjectsIn player.currentSector
	end

	# Save
	if input[0] == "save" then
		player.save
	end

	# Help
	if input[0] == "help" then

	end
end
