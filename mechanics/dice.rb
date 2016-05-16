module Mechanics
	module Dice
		def self.roll
	 		die = []
	 		die << rand(1..6) << rand(1..6) #random dice between 1 & 6 && some random dice between 1 & 6
 		end
	end
end

#dice.rb - file should be named as module when using RAILS
