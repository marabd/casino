# require_relative '../mechanics/cards'
Dir[File.dirname(__FILE__) + '/../mechanics/cards.rb'].each { |file| require file }



module Games
include Mechanics
	class HighLow
		def initialize(player)
			@bet = 0
			@player = player
		end

		def welcome
			puts "Welcome to High / Low."
			puts "Your Balance Is :  #{@player.bankroll}"
			puts "How much would you like to bet?"
			@bet = gets.strip.to_i
		end

		def game
			cards = Mechanics::Deck.new.cards.shuffle
			player_card = cards.first
			dealer_card = cards[1]
			puts "Your card is:"
			puts "#{player_card.rank} #{player_card.suit}"
			puts "Do you think your card is higher or lower than the dealer (higher / lower)?"
			input = gets.strip.downcase
			if input == 'higher'
				if player_card.rank > dealer_card.rank
					player_wins
				elsif player_card.rank < dealer_card.rank
					dealer_wins
				else 
					dealer_card.suit > player_card.suit ? dealer_wins : player_wins
				end
			elsif input == 'lower'
				if player_card.rank < dealer_card.rank
					player_wins
				elsif player_card.rank > dealer_card.rank
					dealer_wins
				else
					dealer_card.suit < player_card.suit ? dealer_wins : player_wins
				end
			else
				# puts "User Input Error, Please Try Again"
				game
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



#class Casino
# 	include Mechanics

# 	def play
# 		puts Mechanics::Dice.roll
# 		cards = Mechanics::Deck.new.cards.shuffle
# 		cards.each do |card|
# 			puts "#{card.rank} of #{card.suit}"
# 		end
# 	end
# end
		# welcome to High / Low
		# need to pull in the 'cards' module
		# card randomly assigned to dealer
		# card randomly assigned to player
		# only show player their card
		# give player option to choose if their card is higher or lower than the dealer
		# get player input (either higher/lower)
		# evaluates compares player's card against dealer's using higher/lower


#require_relative 'mechanics/dice'
# Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each { |file| require file }
