module Stepable

  VERTICAL_AND_HORIZONTAL_DIRS = [
    [1, 0], 
    [-1, 0], 
    [0, 1], 
    [0, -1]
  ]

  DIAGONAL_DIRS = [ 
    [1, 1], 
    [-1, 1], 
    [1, -1],
    [-1, -1]
  ]

    def horizontal_and_vertical_dirs
     VERTICAL_AND_HORIZONTAL_DIRS
    end

    def diagonal_dirs
      DIAGONAL_DIRS
    end
    # collect all the moves that a stepable piece can move to
    def moves
      # create an array to collect moves
      all_moves = self.move_dirs

      collected = []
      all_moves.each do |move|
        collected += grow_unblocked_moves_in_dir(move[0], move[1])
      # iterate through each of the piece's possible move_diffs
        # for each diff, increment the piece's position to generate a new position
        # add the new position to the moves array if it is:
          # valid, on the board and empty
          # OR on the board and contains a pice of the opposite color
        collected
      # return final array of moves
    end
  
    private

    def grow_unblocked_moves_in_dir(dx, dy)

      cur_x, cur_y = @position
      positions = []
  
      
        cur_x += dx
        cur_y += dy
        
        if cur_x.between?(0,7) && cur_y.between?(0,7)
          piece = @board[cur_x][cur_y]

          if piece.nil? || piece.color != @color
            positions << [cur_x, cur_y]
          end
        end
        positions
    end
  
    def move_diffs
      # subclass implements this
      raise NotImplementedError # 
    end
  end
  
  
  # Note: you can invoke methods from the piece from within the module methods, and vice verca. Including a module sets up a two way street