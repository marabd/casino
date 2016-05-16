#require_relative 'mechanics/dice'
Dir[File.dirname(__FILE__) + '/games/*.rb'].each { |file| require file }
include Games

class Player
	attr_accessor :name, :bankroll

	def initialize(name, bankroll)
		@name = name
		@bankroll = bankroll
	end

end

class Casino
	attr_accessor :players

	def initialize
		@players = []
	end

	def welcome
		puts "Welcome to The Ruby Casino!"
		puts "What is your name?"
		name = gets.strip
		puts "What is your bank roll?"
		bankroll = gets.strip.to_i
		@players << Player.new(name, bankroll)
	end

	def menu
		puts "Hi #{@players.first.name}, your current balance is: #{@players.first.bankroll}."
		puts "Please choose from the following games:"
		puts "1. Slots"
		puts "2. High / Low"
		puts "3. Exit"
		case gets.strip
		when '1'
			#reference the Slots module
		when '2'
			#reference the High / Low module
			hilow = Games::HighLow.new(@players.first)
			hilow.welcome
			@players.first.bankroll += hilow.game
			puts "Your bank roll is now : #{@players.first.bankroll}"
		when '3'
			puts "Thanks for playing!"
			exit(0)
		else
			puts "Bad User Input, Please Choose Again."
			menu
		end

	end
		
	def flow
		welcome
		menu
	end
end

Casino.new.flow

	# how do we continuously track the remaining balance?

	# main menu
		# bet function
		# exit
	# thanks for playing

# welcome
# get player name
# get player bank roll
# game menu includes Slots and High/Low
# bankroll increases and decreases with wins and losses

# class Casino
# 	include Mechanics

# 	def play
# 		puts Mechanics::Dice.roll
# 		cards = Mechanics::Deck.new.cards.shuffle
# 		cards.each do |card|
# 			puts "#{card.rank} of #{card.suit}"
# 		end
# 	end
# end

# @game = Casino.new
# @game.play