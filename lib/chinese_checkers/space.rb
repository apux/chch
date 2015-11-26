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
  end
end
