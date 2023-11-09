require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable
  
  

  def symbol
    '♛'.colorize(color)
  end

  protected

  def move_dirs
    # return the directions in which a queen can move
    horizontal_and_vertical_dirs + diagonal_dirs
    # a queen can move horizontally/vertically (across rows and cols) and diagonally
  end
end