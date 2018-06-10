class Sector
	def initialize n
		@name = n
		@description = n
		@needKey = ""
		@sectorLinks = []
		@objects = []
		@players = []
	end

	# setters and getters
	def name= n
		@name = n
	end
	def name
		@name
	end
	def description= d
		@description = d
	end
	def description
		@description
	end
	def needKey= k
		@needKey = k
	end
	def needKey
		@needKey
	end
	def objects
		@objects
	end
	def sectorLinks
		@sectorLinks
	end
	def addItemToSector item
		pushItem = true;
		@inventory.each do |i|
			if i.name.downcase == item.name.downcase then
				i.countAdd 1
				i.name = item.name
				pushItem = false
			end
		end
		if pushItem then
			@inventory.push item
		end
	end
	def removeItemFromSector itemName
		itemFound = false;

		@inventory.each do |i|
			if i.name.downcase == itemName.downcase then
				i.countAdd -1

				if i.count <= 0 then
					@inventory.delete i
				end

				itemFound = true;
			printf "%s removed from your inventory and dropped into current sector\n\n", itemName
			end
		end
		if itemFound == false then
			printf "You don't have any %s in your inventory!\n", itemName
		end
	end
end