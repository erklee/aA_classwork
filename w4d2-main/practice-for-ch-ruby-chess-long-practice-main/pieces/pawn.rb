require_relative 'piece'
require_relative 'stepable'

class Pawn < Piece
  include Stepable

  def symbol
    '♟️'.colorize(color)
  end

  def at_start_row?

  end

  protected

  def move_diffs

    # return an array of diffs representing where a pawn can step to
  end



  private

end