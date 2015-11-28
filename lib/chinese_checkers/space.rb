module ChineseCheckers
  class Space
    attr_accessor :x, :y
    attr_reader :piece

    def initialize(x:, y:, piece: nil)
      @x = x
      @y = y
      @piece = piece
    end

    def put(piece)
      @piece = piece
    end

    def remove_piece
      @piece.tap{ @piece = nil }
    end

    def available?
      !@piece
    end

    def left?(other_space)
      x == other_space.x - 2 and y == other_space.y
    end
  end
end
