require_relative "board.rb"      
require_relative "pieces.rb"

class Game
	def initialize
		@player = nil
	end

	def random_player
		players = ["b", "w"]
		players[rand(2)]
	end

	def play
		board = Board.new
		board.display
		pieces = ChessPieces.new 
		all_pieces = pieces.all_pieces   

	end


end

new_game = Game.new 
new_game.play 