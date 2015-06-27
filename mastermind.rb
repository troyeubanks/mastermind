module Mastermind
	class Game
		def initialize
			@code = generate_code
		end
		attr_reader :code

		def Play
			loop do
				player_guess(@code) #pass code to player_guess and compare

				if player_won?
					puts "Player guessed code: #{@code}!"
					return
				elsif max_turns?
					puts "Player failed to guess code in time!"
					return
				end
			end
		end

		def generate_code
			(rand * 6666).to_i
		end
	end
end

