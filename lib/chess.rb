require_relative "board.rb"      
require_relative "pieces.rb"

board = Board.new
board.display
pieces = ChessPieces.new 
all_pieces = pieces.all_pieces     