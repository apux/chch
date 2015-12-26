module ChineseCheckers

  class SingleMoveValidator
    attr_reader :from, :to

    def initialize(from:, to:)
      @from = from
      @to = to
    end

    def valid?
      from.piece and to.available? and adjacent?
    end

  private

    def adjacent?
      same_y? && two_spaces_from_x? or one_space_from_y? && one_space_from_x?
    end

    def same_y?
      to.y == from.y
    end

    def two_spaces_from_x?
      [from.x - 2, from.x + 2].member? to.x
    end

    def one_space_from_x?
      [from.x - 1, from.x + 1].member? to.x
    end

    def one_space_from_y?
      [from.y - 1, from.y + 1].member? to.y
    end
  end

end
