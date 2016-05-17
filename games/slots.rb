# Dir[File.dirname(__FILE__) + '/../mechanics/cards.rb'].each { |file| require file }


module Games
# include Mechanics
	class Slots

		def initialize(player)
			@bet = 0
			@player = player
		end
		
		def welcome
			puts "Welcome to Ruby Slots"
			puts "Your Balance Is: #{@player}"
			puts "How much would you like to bet?"
			@bet = gets.strip.to_i
		end

		def slot
			puts "And your values are..."
			symbols = []
			symbols << rand(1..9) << rand(1..9) << rand(1..9)
			puts symbols
			if symbols[0] = symbols[1] = symbols[2]
				player_wins
			else
				dealer_wins
			end
		end

		def player_wins
  		puts "Congratulations!"
  		return @bet
  	end

  	def dealer_wins
  		puts "Too Bad!"
  		return @bet * -1
  	end

	end
end

cat = Games::Slots.new(@player)
cat.welcome
cat.slot





