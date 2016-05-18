require 'colorize'
Dir[File.dirname(__FILE__) + '/../mechanics/cards.rb'].each { |file| require file }
module Games
include Mechanics
  class HighLow
    def initialize(player)
      @bet = 0
      @player = player
    end
    def welcome
      puts "Welcome to High / Low.".colorize(:light_blue)
      puts "Your Balance Is:  #{@player.bankroll}".colorize(:green)
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
      cards = Mechanics::Deck.new.cards.shuffle
      player_card = cards.first
      dealer_card = cards[1]
      puts "Your card is:".colorize(:yellow)
      puts "#{player_card.rank} #{player_card.suit}"
      puts "Do you think your card is higher or lower than the dealer (higher / lower)?".colorize(:light_blue)
      input = gets.strip.downcase
      if input == 'higher'
      	puts "Dealer card is: #{dealer_card.rank} #{dealer_card.suit}"
        if player_card.rank > dealer_card.rank
          player_wins
        elsif player_card.rank < dealer_card.rank
          dealer_wins
        else 
          dealer_card.suit > player_card.suit ? dealer_wins : player_wins
        end
      elsif input == 'lower'
      	puts "Dealer card is: #{dealer_card.rank} #{dealer_card.suit}"
        if player_card.rank < dealer_card.rank
          player_wins
        elsif player_card.rank > dealer_card.rank
          dealer_wins
        else
          dealer_card.suit < player_card.suit ? dealer_wins : player_wins
        end
      else
      	puts "Bad User Input, Please Choose Again".colorize(:red)
        game
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