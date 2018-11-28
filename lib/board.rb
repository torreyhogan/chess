require_relative 'pieces.rb'

class Board
	def initialize()
		@board = [["wr","wn","wb","wq","wk","wb","wn","wr"],
							["wp","wp","wp","wp","wp","wp","wp","wp"],
							["-","-","-","-","-","-","-","-"],
							["-","-","-","-","-","-","-","-"],
							["-","-","-","-","-","-","-","-"],
							["-","-","-","-","-","-","-","-"],
							["bp","bp","bp","bp","bp","bp","bp","bp"],
							["br","bn","bb","bq","bk","bb","bn","br"]]
		# @board = [["wr","wn","wb","wq","wk","wb","wn","wr"],
		# 					["-","-","-","-","-","-","-","-"],
		# 					["-","-","-","-","-","-","-","-"],
		# 					["-","-","-","-","-","-","-","-"],
		# 					["-","-","-","-","-","-","-","-"],
		# 					["-","-","-","-","-","-","-","-"],
		# 					["-","-","-","-","-","-","-","-"],
		# 					["br","bn","bb","bq","bk","bb","bn","br"]]
		@pieces = ChessPieces.new
	end

	def display
		all_pieces = @pieces.all_pieces 
		count = 8
		@board.each do |row|
			string = "#{count} "
			row.each do |space|
				if space == "-"
					string += "- "
				else
					space = space.split('')
					color = space[0]
					char = space[1]
					symbol = all_pieces[char]["symbol"][color]
					string += "#{symbol} "
				end
			end
			count -= 1
			puts string
		end
		puts "  a b c d e f g h"
	end

	def location(input,turn)
	end

	def input_translate(input)
		s_to_i = {"a" => 0,"b" => 1,"c" => 2,"d" => 3,"e"=> 4,"f" => 5,"g" => 6,"h" => 7}
		input_a = input.split('')
		if input_a[0] =~ /[1-8]/ && input_a[1] =~ /[a-h]/
			y = 8 - input_a[0].to_i
			x = s_to_i[input_a[1]]
		elsif input_a[1] =~ /[1-8]/ && input_a[0] =~ /[a-h]/
			y = 8 - input_a[1].to_i
			x = s_to_i[input_a[0]]
		else
			puts "Enter a valid entry"
			return false
		end
		return [x,y]

	end

	def what_here(input,turn)
		coordinates = input_translate(input)
		x = coordinates[0].to_i
		y = coordinates[1].to_i
		space = @board[y][x]
		if turn == space.split('')[0]
			return [x,y]
		else 
			puts "Select one of your pieces..."
			return false
		end
	end

	def legal_move(current,player_move,move_delta)
		if @pieces.legal_move(current_space_a[1],current_space_a[0],move_delta) && player_move_what[0] != current_space_a[0]
				@board[player_move[1]][player_move[0]] = current_space
				@board[current[1]][current[0]] = '-'
				valid_piece_move = true
			else 
				puts "Enter valid move"
			end
	end

	def no_obstruction(current,player_move,delta,current_space_a)
		if current_space_a[1] == "n" 
			return true
		end

		if delta[0] == 0
			x_step = 0
		elsif delta[0] > 0
			x_step = 1
		else
			x_step = -1
		end

		if delta[1] == 0
			y_step = 0
		elsif delta[1] > 0
			y_step = 1
		else
			y_step = -1
		end

		x = current[0] 
		y = current[1] 
		x += x_step
		y += y_step

		until x == player_move[0] && y == player_move[1]
			if @board[y][x] != "-"
				return false
			end
			x += x_step
			y += y_step
		end
		return true
	end

	def move_request()
	end

	def valid_request()
		player_move_what = @board.dup[player_move[1].to_i][player_move[0].to_i]
		move_delta = [player_move[0].to_i - current[0].to_i, player_move[1].to_i - current[1].to_i]
		#check for valid move
		all_pieces = @pieces.all_pieces

		current_space = @board[current[1].to_i][current[0].to_i]
		current_space_a = current_space.split('')

		if @pieces.legal_move(current_space_a[1],current_space_a[0],move_delta,current,player_move_what) && 
			player_move_what[0] != current_space_a[0] && 
			no_obstruction(current,player_move,move_delta,current_space_a)

			@board[player_move[1].to_i][player_move[0].to_i] = @board.dup[current[1].to_i][current[0].to_i]
			@board[current[1].to_i][current[0].to_i] = '-'
			return true
		else 
			puts "Enter valid move"
		end

	end

	def what_move(current)
		valid_piece_move = false
		player_move = false
		while player_move == false || valid_piece_move == false
			user_input = gets.chomp
			if user_input == "back"
				return false
			end
			player_move = input_translate(user_input)
			if player_move != false
				player_move_what = @board.dup[player_move[1].to_i][player_move[0].to_i]
				move_delta = [player_move[0].to_i - current[0].to_i, player_move[1].to_i - current[1].to_i]
				#check for valid move
				all_pieces = @pieces.all_pieces

				current_space = @board[current[1].to_i][current[0].to_i]
				current_space_a = current_space.split('')

				if @pieces.legal_move(current_space_a[1],current_space_a[0],move_delta,current,player_move_what) && 
					player_move_what[0] != current_space_a[0] && 
					no_obstruction(current,player_move,move_delta,current_space_a)

					@board[player_move[1].to_i][player_move[0].to_i] = @board.dup[current[1].to_i][current[0].to_i]
					@board[current[1].to_i][current[0].to_i] = '-'
					return true
				else 
					puts "Enter valid move"
				end
			end
		end
	end

	def move(turn)
		valid_entry = false
		valid_move = false
		until valid_entry && valid_move
			puts "Enter the location of the piece you would like to move"
			piece_loc = gets.chomp
			valid_entry = what_here(piece_loc,turn)
			puts "Select where to move \'#{@board[valid_entry[1]][valid_entry[0]]}\' "
			valid_move = what_move(valid_entry)
		end
	end
end