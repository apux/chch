module ChineseCheckers

  class SingleMoveValidator
    def valid?(from:, to:)
      @from = from
      @to = to
      return false if from.nil? or to.nil?

      from.has_a_piece? and to.available? and adjacent?
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
