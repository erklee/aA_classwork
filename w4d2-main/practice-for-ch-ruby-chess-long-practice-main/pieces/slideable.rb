module Slideable

#  HORIZONTAL_AND_VERTICAL_DIRS stores an array of horizontal and vertical directions
    # what a piece moves in a given direction it's row and/or col should increment by some value (change by some value)
    # ex: A piece starts at pos [3, 3] and it moves horizontally to the left 
      # it's position changes to [3, 2]
      # the row increased by 0 and col increased by -1
      # HORIZONTAL_AND_VERTICAL_DIRS = [
      #   [:dx, :dy], # left [0, -1]
      #   [:dx, :dy], # right
      #   [:dx, :dy], # up (vertical)
      #   [:dx, :dy]  # down (vertical)
      # ].freeze
    
      # #  DIAGONAL_DIRS stores an array of diagonal directions
      # DIAGONAL_DIRS = [
      #   [:dx, :dy], # left + up [-1, 1]
      #   [:dx, :dy], # right + up
      #   [:dx, :dy], # left + down
      #   [:dx, :dy]  # right + down
      # ].freeze

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
    
      # should return an array of all the places a Piece can move to
      def moves
        # create an array to collect moves
        # all_moves = VERTICAL_AND_HORIZONTAL_DIRS + DIAGONAL_DIRS
        all_moves = self.move_dirs

        collected = []
        all_moves.each do |move|
          collected += grow_unblocked_moves_in_dir(move[0], move[1])


        end
        # iterate over each of the directions in which a slidable piece can move
          # use the Piece subclass `#move_dirs` method to get the info on each direction 
          # for each direction, collect all possible moves in that direction
            # add moves to our moves array
            #(use the `grow_unblocked_moves_in_dir` helper method)
    
        collected
        # return the final array of moves (containing all possible moves in all directions)
      end
    
      private
    
      def move_dirs
        # subclass implements this
        raise NotImplementedError # this only executes if we don't implement in subclass
      end
    
      def grow_unblocked_moves_in_dir(dx, dy)

        cur_x, cur_y = @position
        positions = []
    
        loop do
          cur_x += dx
          cur_y += dy
          
          break unless cur_x.between?(0,8) && cur_y.between?(0,8)

          piece = @board[cur_x][cur_y]
    
          if piece.nil?
            positions << [cur_x, cur_y]
          else
            if piece.color != @color
              positions << [cur_x, cur_y]
            end
            break
          end
        end
    
        positions
      end

        
        # get the piece's current row and col 
        
        #in a loop:
          # increment the the piece's current rol and col by dx and dy to generate a new position
          # stop incrementing if our new position is invalid (i.e. not on the board)
          # if the new position is empty, the piece can move here, so add the new position to the moves array
          # if the new position is occupied with a pices of the opposite color, our piece can move here (to caputer the opposing pice), so add the new position ot our moves array
            # but, the piece cannot continue past this point. So stop the loop
          # if the new position is occupied by a piece of the same color 
            # stop looping, do not add new position to moves array
    
    
        # return the array of moves for a given direction
      end