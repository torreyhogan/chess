require_relative "board.rb"      
require_relative "pieces.rb"
require_relative "file_management.rb"

class Game
	attr_accessor :board, :player 
	def initialize
		@player = nil
		@board = Board.new
	end

	#save and load game
	

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
	end

	def play
		$save = false
		# pieces = ChessPieces.new 
	
		@board.display
		switch_player
		until @board.win || $save == true
			switch_player
			player_turn
			@board.display
		end
	end


end

files = Files.new
files.start_up