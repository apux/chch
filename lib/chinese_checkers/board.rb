module ChineseCheckers

  class Board
    attr_accessor :spaces

    def initialize
      @spaces = []
    end

    def add(space)
      spaces << space
    end

    def at(x, y)
      spaces.find { |s| s.x == x and s.y == y }
    end
  end

end
