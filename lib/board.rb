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
	end

	def display
		pieces = ChessPieces.new 
		all_pieces = pieces.all_pieces 
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

	def what_here(input,turn)
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
		space = @board[y.to_i][x.to_i]

		if turn == space.split('')[0]
			return true
		else 
			puts "Select one of your pieces..."
			return false
		end
	end


end