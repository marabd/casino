require 'colorize'
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
		@number_of_players = all_players
		@current_player
	end
	# when player searches to change player, they are searching to see if their name exists in the array for the name
	# array.index


	def all_players
		puts "Welcome to The Ruby Casino!".colorize(:light_blue)
		puts "Hi! How Many Players are there?".colorize(:light_blue)
		player_num=gets.strip.to_i
		player_num.times do
			welcome
		end
		return player_num
	end

	def welcome
		puts "Enter your name?"
		name = gets.strip
		puts "Enter your bankroll?".colorize(:green)
		bankroll = gets.strip.to_i
		@current_player = Player.new(name, bankroll)
		@players << @current_player
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

	def current_menu
		puts "Do you want to switch the player? type'y'"
		choice = gets.strip.to_s
		if choice == 'y'
			puts ""
		elsif choice == 'n'
			menu
		else
			puts "Please type 'y/n'"
			current_menu
		end
	end
		
	def end_of_game
	  	puts "Thanks for playing!".colorize(:light_blue)
	  	puts "What would you like to do now?".colorize(:light_blue)
	  	puts "1. Return to the Main Menu"
	  	puts "2. Switch Player"
	  	puts "3. Exit"
		case gets.strip
	  	when '1'
	  		menu
	  	when '2'
	  		@players.length.times do |n|
	  			puts "Type #{n+1} for #{@players[n].name}"
			end
			# TODO FIX
			# gets.strip.to_i
			# case
			# when ""

			# end
	  	when '3'
	  		exit(0)
	  	else
	  		puts "Bad User Input, Please Choose Again".colorize(:red)
	  		end_of_game
	  	end
	end
			
	def flow
		menu
	end
end

Casino.new.flow
