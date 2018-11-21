class ChessPieces
	def initialize()
	
	end

	#return hash filled with token info - unicode, allowable moves, 
	def king()
		king_hash = {}
		king_hash["moves"]=[[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1]]
		king_hash["symbol"] = {"w"=>"♔", "b"=>"♚"}
		king_hash
	end

	def queen
	end

	def bishop
	end

	def knight
	end

	def rook
	end

	def pawn
	end

	def all_pieces
		all_pieces = {"king"=> king}
	end
end