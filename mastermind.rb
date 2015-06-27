module Mastermind
	class Game
		def initialize
			@code = generate_code
			@turn = 0
		end
		attr_reader :code, :guess, :turn

		def play
			loop do
				player_guess
				puts @guess

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
			#(rand * 6666).to_i
			1234 #used for testing
		end

		def player_won?(guess, code)
			return true if guess == code
			false
		end

		def max_turns?
			return true if @turn > 12
			false
		end

		def player_guess
			puts "Please enter a four-digit guess: "
			begin
				input = Integer(gets)
			rescue ArgumentError
				puts "Please enter a number"
			end
			set_guess(input)
		end

		def set_guess(guess)
			@guess = guess
		end

		def parse_input(input)

		end

		def get_state(input, code)
			counter = 0
			code_arr = code.to_s.split('')
			result = Array.new(4)
			input.to_s.split('').each do |i|
				result[counter] = "O" if code_arr[counter] == i
				result[counter] ||= "*" if code_arr.include?(i)
				result[counter] ||= "x"
				counter += 1
			end
		end			

	end
end

include Mastermind

test = Game.new.play