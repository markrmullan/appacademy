require_relative 'piece'
require 'byebug'
class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new (8)}
  end

  def move(start, end_pos)
    self[end_pos] = self[start]
    self[start].pos = end_pos
    self[start] = nil
  end

  def populate_board
  end

  def []=(pos, value)
    # debugger
    x,y = pos
    grid[x][y] = value
  end

  def [](pos)
    x,y = pos
    grid[x][y]
  end
end

p test_board = Board.new
sleep(1)
p test_board[[0, 0]] = Piece.new("Pawn")
# p test_board[[0,0]]
sleep(1)
# p test_board.grid[2][2] = Piece.new("Bishop")
# sleep(1)
p test_board.move([0,0], [1,1])
p test_board
