# Dir[File.dirname(__FILE__) + '/../mechanics/cards.rb'].each { |file| require file }


module Games
	class Slots

		def initialize(player)
			@bet = 0
			@player = player
		end
		
		def welcome
			puts "Welcome to Ruby Slots"
			puts "Your Balance Is: #{@player.bankroll}"
			puts "How much would you like to bet?"
			@bet = gets.strip.to_i
		end

		def game
			symbols = ["❤", "☂", "♞", "∞", "☀", "❄"]

			symb1 = []
			symb2 = []
			symb3 = []

			symb1 << symbols.sample << symbols.sample << symbols.sample
			symb2 << symbols.sample << symbols.sample << symbols.sample
			symb3 << symbols.sample << symbols.sample << symbols.sample

			puts "And your slots are..."
			puts symb1.join(" ")
			puts symb2.join(" ")
			puts symb3.join(" ")

			if symb1[0] == symb1[1] && symb1[1] == symb1[2]
				player_wins
			elsif symb2[0] == symb2[1] && symb2[1] == symb2[2]
				player_wins
			elsif symb3[0] == symb3[1] && symb3[1] == symb3[2]
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

