RSpec.describe Board do
	describe "#what_here" do
		it "retruns true if player chooses own piece" do
			new_board = Board.new
			expect(new_board.what_here("d7","b")).to eql(true)
		end
	end
end