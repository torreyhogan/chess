require_relative "board.rb"      
require_relative "pieces.rb"

class Game
	def initialize
		@player = nil
	end

# switch player color or pick random player to start
	def switch_player
		if @player == "b"
			@player = "w"
		elsif @player == "w"
			@player = "b"
		else
			@players = ["b", "w"][rand(2)]
	end

	def move

	def play
		board = Board.new
		pieces = ChessPieces.new 
		board.display
		all_pieces = pieces.all_pieces
		switch_player
		move

	end


end

new_game = Game.new 
new_game.play 