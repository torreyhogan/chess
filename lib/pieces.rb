class ChessPieces
	def initialize()
	
	end

	#return hash filled with token info - unicode, allowable moves, 
	def king
		king_hash = {}
		king_hash["moves"]=[[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1]]
		king_hash["symbol"] = {"w"=>"♔", "b"=>"♚"}
		king_hash
	end

	def queen
		queen_hash = {}
		queen_hash["moves"] = []
		queen_hash["symbol"] = {"w"=>"♕", "b"=>"♛"}
		queen_hash
	end

	def bishop
		bishop_hash = {}
		bishop_hash["symbol"] = {"w"=>"♗", "b"=>"♝"}
		bishop_hash
	end

	def knight
		knight_hash = {}
		knight_hash["symbol"] = {"w"=>"♘", "b"=>"♞"}
		knight_hash
	end

	def rook
		rook_hash = {}
		rook_hash["symbol"] = {"w"=>"♖", "b"=>"♜"}
		rook_hash
	end

	def pawn
		pawn_hash = {}
		pawn_hash["symbol"] = {"w"=>"♙", "b"=>"♟"}
		pawn_hash
	end

	def all_pieces
		all_pieces = {"k"=> king,"q"=> queen,"b"=> bishop,"n"=> knight,"r"=> rook,"p"=>pawn}
	end
end