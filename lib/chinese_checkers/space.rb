module ChineseCheckers

  class Space
    attr_reader :x, :y
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
      @piece.tap { @piece = nil }
    end

    def has_a_piece?
      !!@piece
    end

    def available?
      !has_a_piece?
    end
  end

end
