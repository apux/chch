module ChineseCheckers
  class Piece
    attr_accessor :x, :y, :color

    def initialize(x:, y:, color: nil)
     @x = x
     @y = y
     @color = color
    end
  end
end
