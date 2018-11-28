require_relative "board.rb"      
require_relative "pieces.rb"

class Game
	attr_accessor :board, :player 
	def initialize
		@player = nil
		@board = nil
	end

# switch player color or pick random player to start
	def switch_player
		if @player == "b"
			@player = "w"
		elsif @player == "w"
			@player = "b"
		else
			@player = ["b", "w"][rand(2)]
		end

	end



	def player_turn
		@player == 'b' ? name = "Black" : name = "White"
		puts "#{name}\'s turn"
		@board.move(@player)
		# valid_entry = false
		# until valid_entry
		# 	piece_loc = gets.chomp
		# 	valid_entry = @board.what_here(piece_loc,@player)
		# end
		# puts "thanks"
		
		# puts "Where would you like to "

	end

	def play
		pieces = ChessPieces.new 
		@board = Board.new
		@board.display
		# all_pieces = pieces.all_pieces
		while true
			switch_player
			player_turn
			@board.display
		end

	end


end

new_game = Game.new 
new_game.play 