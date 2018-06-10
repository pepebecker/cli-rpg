class Item
	def initialize n
		@name = n
		@description = n
		@count = 1
		@value = 0
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
	def count= c
		@count = c
	end
	def countAdd c
		@count += c
	end
	def count
		@count
	end
	def value= v
		@value = v
	end
	def value
		@value
	end
end