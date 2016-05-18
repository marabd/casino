require 'colorize'
module Games
  class Roulette
    def initialize(player)
      @bet = 0
      @player = player
    end
    
    def welcome
      puts "Welcome to Ruby Roulette".colorize(:light_blue)
      puts "Your Balance Is: #{@player.bankroll}".colorize(:green)
      puts "How much would you like to bet?".colorize(:light_blue)
      @bet = gets.strip.to_i
      if @player.bankroll < @bet
      puts "You cannot bet more than you have in bankroll".colorize(:red)
      exit(0)
    else
      puts ""
    end
    end
    def game
      @num = []
      @num << rand(36)
      @red = [1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36]
      @black = [2,4,6,8,10,11,13,15,17,20,22,24,26,28,29,31,33,35]
      puts "What would you like to bet on?"
      puts "1. The Number"
      puts "2. The Color"
      puts "3. Odd or Even"
      choice = gets.strip.to_i
      if choice == 1
        number
      elsif choice == 2
        color
      elsif choice == 3
        even_odd
      else
        puts "Bad User Input, Please Try Again"
        game
      end
    end
    def number
      puts "What number would you like to bet on?".colorize(:light_blue)
      usernum = gets.strip
      puts "And the ball lands on... #{@num[0]}".colorize(:yellow)
      if usernum == @num[0]
        player_wins
      else
        dealer_wins
      end
    end
    def color
      puts "What color would you like to bet on?".colorize(:light_blue)
      usercolor = gets.strip.downcase
      puts "And the ball lands on...".colorize(:yellow)
      if usercolor == 'red'
        if @red.include?@num[0]
          puts "red #{@num[0]}".colorize(:red)
          player_wins
        else
          puts "black #{@num[0]}"
          dealer_wins
        end
      elsif usercolor == 'black'
        if @black.include?@num[0]
          puts "black #{@num[0]}"
          player_wins
        else
          puts "red #{@num[0]}".colorize(:red)
          dealer_wins
        end
      else
        puts "Bad User Input, Please Try Again".colorize(:red)
        color
      end
    end
    def even_odd
      puts "Would you like to bet on even or odd?".colorize(:light_blue)
      user_even = gets.strip.downcase
      puts "And the ball lands on... #{@num[0]}".colorize(:yellow)
      if user_even == 'even'
        if @num[0] % 2 == 0
          player_wins
        else
          dealer_wins
        end
      elsif user_even == 'odd'
        if @num[0] % 2 != 0
          player_wins
        else
          dealer_wins
        end
      end
    end
    def player_wins
    	puts "Congratulations!".colorize(:light_blue)
    	return @bet
  	end
  	def dealer_wins
    	puts "Too Bad!".colorize(:red)
    	return @bet * -1
  	end
  end
end