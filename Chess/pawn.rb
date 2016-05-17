
require_relative 'piece'
class Pawn < Piece
  attr_reader :color

  PAWN_DELTAS = [
    [-1, 0],
    [-1, -1],
    [-1, 1],
    [1, 0],
    [1, 1],
    [1, -1],
  ]

  def initialize(name, color = :black)
    super(name)
    @color = color
  end

  def moves   ####### use proce for drop/take blocks
    possible_moves = []
    if color == :black
      PAWN_DELTAS.drop(3).each do |delta|
        x , y = self.pos[0] , self.pos[1]
        dx , dy = delta[0], delta[1]
        possible_moves << [(x + dx),(y + dy)]
      end
    else
      PAWN_DELTAS.take(3).each do |delta|
        x , y = self.pos[0] , self.pos[1]
        dx , dy = delta[0], delta[1]
        possible_moves << [(x + dx),(y + dy)]
      end
    end
    possible_moves
  end

end
