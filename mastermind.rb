module Mastermind
	class Game
		def initialize
			@code = generate_code
			@turn = 0
		end
		attr_reader :code, :guess, :turn

		def play
			loop do
				player_guess(@guess)

				if player_won?(@guess, @code)
					puts "Player guessed code: #{@code}!"
					return
				elsif max_turns?
					puts "Player failed to guess code in time!"
					return
				end
				@turn += 1
			end
		end

		def generate_code
			(rand * 6666).to_i
		end

		def player_won?(guess, code)
			return true if guess == code
			false
		end

		def max_turns?
			return true if @turn > 12
			false
		end

		def player_guess; end



	end
end

include Mastermind

test = Game.new.play