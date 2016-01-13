module ChineseCheckers

  class SingleMoveStrategy
    def valid?(move)
      @from = move.from
      @to = move.to
      adjacent?
    end

  private

    attr_reader :from, :to

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
