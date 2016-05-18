# Dir[File.dirname(__FILE__) + '/../mechanics/cards.rb'].each { |file| require file }
require 'colorize'
module Games
  class Slots
    def initialize(player)
        @bet = 0
        @player = player
    end
    
    def welcome
        puts "Welcome to Ruby Slots".colorize(:light_blue)
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
      symbols = ["❤", "☂", "♞", "∞", "☀", "❄"]
      symb1 = []
      symb2 = []
      symb3 = []
      symb1 << symbols.sample << symbols.sample << symbols.sample
      symb2 << symbols.sample << symbols.sample << symbols.sample
      symb3 << symbols.sample << symbols.sample << symbols.sample
      puts "And your slots are...".colorize(:yellow)
      puts symb1.join(" ").colorize(:yellow)
      puts symb2.join(" ").colorize(:yellow)
      puts symb3.join(" ").colorize(:yellow)
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
      puts "Congratulations!".colorize(:light_blue)
      return @bet
    end
    def dealer_wins
      puts "Too Bad!".colorize(:red)
      return @bet * -1
    end
  end
end