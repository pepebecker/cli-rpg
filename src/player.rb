class Player
	def initialize
		@name = ""
		@nameSet = false
		@currentSector = nil;
		@inventory = []
		@gold = 0
	end

	# setters and getters
	def name= n
		@name = n
	end
	def name
		@name
	end
	def nameSet= b
		@nameSet = b
	end
	def nameSet
		@nameSet
	end
	def currentSector= cs
		@currentSector = cs
	end
	def currentSector
		@currentSector
	end
	def inventory
		@inventory
	end
	def showInventory
		printf "\n---Inventory---\n"
		@inventory.each do |item|
			printf "%s (%i)\n", item.name, item.count
		end
		printf "---------------\n\n"
	end
	def getItemFromInventory itemName
		@inventory.each do |i|
			if i.name.downcase == itemName then
				return i
			end
		end
	end
	def addItemToInventory item
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
	def removeItemFromInventory itemName
		itemFound = false;

		@inventory.each do |i|
			if i.name.downcase == itemName.downcase then
				i.countAdd -1

				if i.count <= 0 then
					@inventory.delete i
				end

				itemFound = true;
				i
			end
		end
		if itemFound == false then
			printf "\nYou don't have any %s in your inventory!\n\n", itemName
		end
	end
	def goto nameOfRequestedSector, availableSectors
		if nameOfRequestedSector && nameOfRequestedSector.delete(' ') != "" then
			requestedSectorExsist = false
			requestedSectorFound = false
			availableSectors.each do |as|
				if as.name.to_s == nameOfRequestedSector then
					requestedSectorExsist = true
					@currentSector.sectorLinks.each do |door|
						if door.name.to_s == as.name.to_s then
							@currentSector = as
							requestedSectorFound = true
							printf "\nYou are now in sector: %s\n\n", @currentSector.name
						end
					end
				end
			end
			if requestedSectorExsist == false then
				printf "\nSector: %s doesn't exist!\n\n", nameOfRequestedSector
			elsif requestedSectorFound == false then
				printf "\nNot possible to go to sector: %s from here!\n\n", nameOfRequestedSector
			end
		else
			printf "\ngoto <sector>\n\n"
		end
	end
	def drop itemName
		if itemName && itemName.delete(' ') != "" then
			item = getItemFromInventory itemName
			removeItemFromInventory itemName
			if item then
				@currentSector.objects.push item
				printf "\n%s removed from your inventory and dropped into current sector\n\n", item.name
			end
		else
			printf "\ndrop <itemname>\n\n"
		end
	end
	def take itemName
		# TODO
	end
end




