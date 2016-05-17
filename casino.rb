require 'colorize'
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
	# when player searches to change player, they are searching to see if their name exists in the array for the name
	# array.index

	def welcome
		puts "Welcome to The Ruby Casino!".colorize(:light_blue)
		puts "What is your name?".colorize(:light_blue)
		name = gets.strip
		puts "What is your bank roll?".colorize(:green)
		bankroll = gets.strip.to_i
		@players << Player.new(name, bankroll)
	end

	def menu
		puts "Hi #{@players.first.name}, your current balance is: #{@players.first.bankroll}.".colorize(:green)
		puts "Please choose from the following games:".colorize(:light_blue)
		puts "1. Slots"
		puts "2. High / Low"
		puts "3. Roulette"
		puts "4. Exit"
		case gets.strip
		when '1'
			slot_play = Games::Slots.new(@players.first)
			slot_play.welcome
			@players.first.bankroll += slot_play.game
			puts "Your bank roll is now: #{@players.first.bankroll}"
			end_of_game
		when '2'
			hilow = Games::HighLow.new(@players.first)
			hilow.welcome
			@players.first.bankroll += hilow.game
			puts "Your bank roll is now: #{@players.first.bankroll}"
			end_of_game
		when '3'
			roul = Games::Roulette.new(@players.first)
			roul.welcome
			@players.first.bankroll += roul.game
			puts "Your bank roll is now: #{@players.first.bankroll}"
			end_of_game
		when '4'
			puts "Thanks for playing!".colorize(:light_blue)
			exit(0)
		else
			puts "Bad User Input, Please Choose Again.".colorize(:red)
			menu
		end

	end
		
	def end_of_game
  	puts "Thanks for playing!".colorize(:light_blue)
  	puts "What would you like to do now?".colorize(:light_blue)
  	puts "1. Return to the Main Menu"
  	puts "2. Exit"
		case gets.strip
  	when '1'
  		menu
  	when '2'
  		exit(0)
  	else
  		puts "Bad User Input, Please Choose Again".colorize(:red)
  		end_of_game
  	end
	end
			
	def flow
		welcome
		menu
	end
end

Casino.new.flow


# 	def play
# 		puts Mechanics::Dice.roll
# 		cards = Mechanics::Deck.new.cards.shuffle
# 		cards.each do |card|
# 			puts "#{card.rank} of #{card.suit}"
# 		end
# 	end
# end