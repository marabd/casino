#require_relative 'mechanics/dice'
Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file }

class Casino
	include Mechanics

	def play
		puts Mechanics::Dice.roll
		cards = Mechanics::Deck.new.cards.shuffle
		cards.each do |card|
			puts "#{card.rank} of #{card.suit}"
		end
	end
end

@game = Casino.new
@game.play