require_relative 'board'
require_relative 'cursorable'
require 'colorize'
require "io/console"

class Display
  include Cursorable

  def initialize(grid = nil)
    @cursor = STDIN.getch
    @selected = false
    @grid = Board.new.grid
  end

  
  def build_grid
    @grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :blue
    end
    { background: bg, color: :white }
  end

  def render
    build_grid.each { |row| puts row.join }
  end

end
