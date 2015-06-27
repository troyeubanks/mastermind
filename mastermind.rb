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
				puts "#{get_state(@guess, @code)}  //(o = match, * = wrong place, right num, x = wrong num)"

				if player_won?(@guess, @code)
					puts "Player guessed correct code: #{@code}!"
					return
				elsif max_turns?
					puts "Player failed to guess code in time!"
					return
				end
				@turn += 1
			end
		end

		def generate_code
			(rand * 9999).to_i
			#1234 #used for testing
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
			puts "\n\nTurn #{@turn} -- Enter guess: "
			begin
				input = Integer(gets)
			rescue ArgumentError
				puts "Please enter a number"
			end
			if input.to_s.length != 4
				puts "Code is four digits. Please try again"
				player_guess
			end
			set_guess(input)
		end

		def set_guess(guess)
			@guess = guess
		end

		def parse_input(input)
			get_state(input, @code)
		end

		def get_state(input, code)
			counter = 0
			code_arr = code.to_s.split('')
			result = Array.new(4)
			input.to_s.split('').each do |i|
				result[counter] = "o" if code_arr[counter] == i
				result[counter] ||= "*" if code_arr.include?(i)
				result[counter] ||= "x"
				counter += 1
			end
			result.join
		end



	end
end

include Mastermind

test = Game.new.play