class Piece

    include Slideable
    include Stepable

    attr_accessor :piece

    def initialize(color, val)
        @val = val
        @color = color
    end

    def moves
        possible_positions = []
        return possible_positions
    end
end




