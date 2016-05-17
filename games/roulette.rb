
module Games
	class Roulette

		def initialize(player)
			@bet = 0
			@player = player
		end
		
		def welcome
			puts "Welcome to Ruby Roulette"
			puts "Your Balance Is: #{@player.bankroll}"
			puts "How much would you like to bet?"
			@bet = gets.strip.to_i
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
			puts "What number would you like to bet on?"
			usernum = gets.strip
			puts "And the ball lands on... #{@num[0]}"
			if usernum == @num[0]
				player_wins
			else
				dealer_wins
			end
		end

		def color
			puts "What color would you like to bet on?"
			usercolor = gets.strip.downcase
			puts "And the ball lands on..."
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
				puts "Bad User Input, Please Try Again"
				color
			end
		end

		def even_odd
			puts "Would you like to bet on even or odd?"
			user_even = gets.strip.downcase
			puts "And the ball lands on... #{@num[0]}"
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
  		puts "Congratulations!"
  		return @bet
  	end

  	def dealer_wins
  		puts "Too Bad!"
  		return @bet * -1
  	end
  end
end
