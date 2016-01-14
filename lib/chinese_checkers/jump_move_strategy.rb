module ChineseCheckers
  class JumpMoveStrategy
    def initialize(board:)
      @board = board
    end

    def valid?(move)
      @move = move
      jump_a_space? && piece_in_the_middle?
    end

  private

    attr_reader :move

    def jump_a_space?
      jump_left? ||
        jump_right? ||
        jump_bottom_left? ||
        jump_bottom_right? ||
        jump_top_left? ||
        jump_top_right?
    end

    def jump_left?
      move.from.x - 4 == move.to.x && move.from.y == move.to.y
    end

    def jump_right?
      move.from.x + 4 == move.to.x && move.from.y == move.to.y
    end

    def jump_bottom_left?
      move.from.x - 2 == move.to.x && move.from.y + 2 == move.to.y
    end

    def jump_bottom_right?
      move.from.x + 2 == move.to.x && move.from.y + 2 == move.to.y
    end

    def jump_top_left?
      move.from.x - 2 == move.to.x && move.from.y - 2 == move.to.y
    end

    def jump_top_right?
      move.from.x + 2 == move.to.x && move.from.y - 2 == move.to.y
    end

    def piece_in_the_middle?
      @board.at(middle_x, middle_y).has_a_piece?
    end

    def middle_x
      (move.from.x + move.to.x) / 2
    end

    def middle_y
      (move.from.y + move.to.y) / 2
    end
  end
end
