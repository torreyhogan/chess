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
		@board.each do |row|
			string = ""
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
			puts string
		end
	end

end