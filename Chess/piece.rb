class Piece
  attr_reader :name
  attr_accessor :pos

  def initialize(name)
    @name = name
    @pos = [0, 0]
  end

  def moves
    #valid_moves
  end
end

class SlidingPiece < Piece
  def initialize(name)
    super(name)

  end

  def moves
    verticals + horizontals + forward_diag + backwards_diag if self.is_a?(Queen)
    verticals + horizontals if self.is_a?(Rook)
    forward_diag + backwards_diag if self.is_a?(Bishop)
  end

  def move_dirs
    vertical = [self.pos]

  end

  def verticals
    positions = []
    0.upto(7).each do |y|
      positions << [self.pos[0],y]
    end
    positions.delete_if{|coord| coord == self.pos}
  end

  def horizontals
    positions = []
    0.upto(7).each do |x|
      positions << [x, self.pos[1]]
    end
    positions.delete_if{|coord| coord == self.pos}
  end

  def forward_diag
    diags = []
    x, y = self.pos[0], self.pos[1]
    until y == 7 || x == 7
      x += 1
      y += 1
      diags << [x,y]
    end

    x, y = self.pos[0], self.pos[1]
    until y == 0 || x == 0
      x -= 1
      y -= 1
      diags << [x,y]
    end
  diags
end

def backwards_diag
    diags = []
    x, y = self.pos[0], self.pos[1]
    until y == 7 || x == 0
      x -= 1
      y += 1
      diags << [x,y]
    end

    x, y = self.pos[0], self.pos[1]
    until y == 0 || x == 7
      x += 1
      y -= 1
      diags << [x,y]
    end
  diags
end


end
