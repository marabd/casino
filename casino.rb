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
    puts "How many players are there?".colorize(:light_blue)
    player_num=gets.strip.to_i
    player_num.times do
      welcome
    end
    return player_num
  end
  def welcome
    puts "Enter your name:".colorize(:light_blue)
    name = gets.strip
    puts "Enter your bankroll:".colorize(:green)
    bankroll = gets.strip.to_i
    @current_player = Player.new(name, bankroll)
    @players << @current_player
  end
  def menu
    if @current_player.bankroll > 0
      puts ""
    else
      puts no_money
    end
    puts "Hi #{@current_player.name}, your current balance is: #{@current_player.bankroll}.".colorize(:green)
    puts "Please choose from the following games:".colorize(:light_blue)
    puts "1. Slots"
    puts "2. High / Low"
    puts "3. Roulette"
    puts "4. Exit"
    case gets.strip
    when '1'
      slot_play = Games::Slots.new(@current_player)
      slot_play.welcome
      @current_player.bankroll += slot_play.game
      puts "Your bank roll is now: #{@current_player.bankroll}".colorize(:green)
      end_of_game
    when '2'
      hilow = Games::HighLow.new(@current_player)
      hilow.welcome
      @current_player.bankroll += hilow.game
      puts "Your bank roll is now: #{@current_player.bankroll}".colorize(:green)
      end_of_game
    when '3'
      roul = Games::Roulette.new(@current_player)
      roul.welcome
      @current_player.bankroll += roul.game
      puts "Your bank roll is now: #{@current_player.bankroll}".colorize(:green)
      end_of_game
    when '4'
      puts "Thank you for playing Ruby Casino! Goodbye.".colorize(:light_blue)
      exit(0)
    else
      puts "Bad User Input, Please Choose Again.".colorize(:red)
      menu
    end
  end
  def no_money
    puts "You dont have enough balance to play! Try Again later".colorize(:red)
    puts "Would you like switch the player? type'y/n'".colorize(:light_blue)
    choice = gets.strip.to_s
    if choice == 'y'
      @players.length.times do |n|
      @cur = @players[n]
      if @cur.bankroll >0
  	    puts "Type #{n+1} for #{@cur.name}"
      end
    end
      selection = gets.strip.to_i
      @current_player = @players[selection]
      menu
    elsif choice == 'n'
      puts "Thank you for playing Ruby Casino! Goodbye.".colorize(:light_blue)
      exit(0)
    else
      puts "Bad User Input, Please Choose Again.".colorize(:red)
      no_money
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
      selection = gets.strip.to_i - 1
      @current_player = @players[selection]
      puts @current_player.name
      menu
  	when '3'
  		puts "Thank you for playing Ruby Casino! Goodbye.".colorize(:light_blue)
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