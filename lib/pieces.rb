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
		knight_hash["moves"] = [[2,1],[1,2],[-1,2],[1,-2],[-1,-2],[-2,1],[2,-1],[-2,-1]]
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
		pawn_hash["moves"] = {"w"=> {"first" => [[0,-2],[0,-1]], "second"=>[0,-1]}, "b" => {"first" => [[0,2],[0,1]], "second"=>[0,1]}}
		pawn_hash["symbol"] = {"w"=>"♙", "b"=>"♟"}
		pawn_hash
	end

	def all_pieces
		all_pieces = {"k"=> king,"q"=> queen,"b"=> bishop,"n"=> knight,"r"=> rook,"p"=>pawn}
	end

	def legal_move(piece,color,delta)
		pieces = all_pieces
		case piece
		when "k"
			pieces["k"]["moves"].include?(delta)
		when "q"
			(delta[0] == delta[1] || delta[0] == -delta[1]) || (delta[0] == 0 || delta[1] == 0)
		when "b"
			delta[0] == delta[1] || delta[0] == -delta[1]
		when "n"
			pieces["n"]["moves"].include?(delta)
		when "r"
			delta[0] == 0 || delta[1] == 0
		when "p"

		end

	end

	def pawn_move

	end





end

