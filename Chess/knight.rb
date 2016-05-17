require_relative 'stepping_pieces'

class Knight < SteppingPieces
  KNIGHT_DELTAS = [
    [-1, 2],
    [-1, -2],
    [1, 2],
    [1, -2],
    [2, -1],
    [2, 1],
    [-2, -1],
    [-2, 1]
  ]

  def initialize(name)
    super(name)
  end

  def moves
    possible_moves = []
    KNIGHT_DELTAS.each do |delta|
      x , y = self.pos[0] , self.pos[1]
      dx , dy = delta[0], delta[1]
      possible_moves << [(x + dx),(y + dy)]
    end

    possible_moves.select do |move|
      move[0].between?(0,7) && move[1].between?(0,7)
    end
  end
end
