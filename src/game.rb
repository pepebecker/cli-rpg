require './Player'
require './Item'
require './Sector'

class Game
	def initialize player
		@player = player
		@running = false;
		@sectors = []

		# Create sectors
		for i in 1..11
			sector = Sector.new i
			if i < 11 then
				sl = Sector.new sprintf "%i", i+1
				sector.sectorLinks.push sl
			end
			if i > 1 then
				sl = Sector.new sprintf "%i", i-1
				sector.sectorLinks.push sl
			end
			if i == 2 then
				sl = Sector.new sprintf "%i", 11
				sector.sectorLinks.push sl
			elsif i == 11 then
				sl = Sector.new sprintf "%i", 2
				sector.sectorLinks.push sl
			end
			@sectors.push sector
		end
	end

	def running= b
		@running = b
	end
	def running
		@running
	end
	def sectors= ss
		@sectors = ss
	end
	def sectors
		@sectors
	end

	def exit
		abort "You ended the game"
	end

	def showMap
		printf "\n------Map------\n"
		@sectors.each do |sector|
			if sector.name == @player.currentSector.name then
				printf "Sector: %s - %s\n", sector.name, @player.name
			else
				printf "Sector: %s\n", sector.name
			end
			sector.sectorLinks.each do |sl|
				printf " - [%s]\n", sl.name
			end
		end
		printf "---------------\n\n"
	end

	def showDoorsFor sector
		printf "\n---Sector: %s---\n", sector.name
		sector.sectorLinks.each do |sl|
			printf " - [%s]\n", sl.name
		end
		printf "---------------\n\n"
	end

	def showObjectsIn sector
		printf "\n----Objects----\n"
		sector.objects.each do |obj|
			printf "[%s]\n", obj.name
		end
		printf "---------------\n\n"
	end
end


