require_relative 'piece'

class SteppingPieces < Piece
  def initialize(name)
    super(name)
  end

  def moves

  end

end

class King < SteppingPieces
  KING_DELTAS = [0,1,-1,1,-1].permutation(2).to_a.uniq

  def initialize(name)
    super(name)
  end

  def moves
    possible_moves = []
      KING_DELTAS.each do |delta|
        x , y = self.pos[0] , self.pos[1]
        dx , dy = delta[0], delta[1]
        possible_moves << [(x + dx),(y + dy)]
      end

    possible_moves.select do |move|
      move[0].between?(0,7) && move[1].between?(0,7)
    end

  end
end
