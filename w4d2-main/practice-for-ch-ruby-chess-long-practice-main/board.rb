require_relative 'pieces'
require 'byebug'

class Board
    attr_reader :board
   
    def initialize
        @board = Array.new(8) {Array.new(8)}
        populate_board
    end

    def fill_board
        (0..1).each do |row|
           board[row].map! {Piece.new}
        end
        (6..7).each do |row|
            board[row].map! {Piece.new}
        end 
    end

    def [](pos)
        row, col  = pos
        @board[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @board[row][col] = val
    end

    def move_piece(start_pos, end_pos) 
        if self[start_pos].is_a?(NullPiece)
          raise NoPieceError.new 'piece here sorry'
        elsif !self[end_pos].is_a?(NullPiece)
          raise InvalidMoveError.new 'cannot move here'
        else
          self[end_pos] = self[start_pos]
          self[start_pos] = nil
        end
      end

    def print_board
        @board.each do |row|
          row.each do |cell|
            print cell.nil? ? "_" : "P", " "
          end
          puts
        end
      end

      def spawn_back_row(row_pos, col_pos, color)
        case col_pos 
        when 0, 7
          @board[row_pos][col_pos] = Rook.new(color, " R ")
        when 1, 6
          @board[row_pos][col_pos] = Knight.new(color, " N ")
        when 2, 5
          @board[row_pos][col_pos] = Bishop.new(color, " B ")
        when 3
          @board[row_pos][col_pos] = Queen.new(color, " Q ")
        when 4
          @board[row_pos][col_pos] = King.new(color, " K ")
        end
      end
    
      def spawn_front_row(row_pos, col_pos, color)
        case row_pos 
        when 1,6
          @board[row_pos][col_pos] = Pawn.new(color, " P ")
        end
      end


  def populate_board 
    @board.each_with_index do |row, row_pos| 
      row.each_index do |col_pos| 
        if row_pos == 0 
          spawn_back_row(row_pos, col_pos, :black)
        elsif row_pos == 7 
          spawn_back_row(row_pos, col_pos, :white)
        elsif row_pos == 1 
          spawn_front_row(row_pos, col_pos, :black)
        elsif row_pos == 6 
          spawn_front_row(row_pos, col_pos, :white)
        else
          @board[row_pos][col_pos] = NullPiece.instance
        end
      end
    end
  end
end

# def valid_pos?(pos)
#     row, col = pos 
#     row.between?(0,7) && col.between?(0,7)
#   end

# end




# a = Board.new
# a.print_board
# # print a.board

# a.move_piece([1,1],[5,5])
# a.print_board