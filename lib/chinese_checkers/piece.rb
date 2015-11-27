module ChineseCheckers
  class Piece
    attr_accessor :color, :space

    def initialize(color: nil, space: nil)
      @space = space
      @color = color
    end
  end
end
