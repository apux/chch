require 'test_helper'
require 'chinese_checkers/board'
require 'chinese_checkers/space'

module ChineseCheckers

  class TestBoard < Minitest::Test
    def setup
      @board = Board.new
    end

    def test_at_returns_the_given_space
      space_1 = Space.new(x: 1, y: 1)
      space_2 = Space.new(x: 2, y: 4)

      @board.add(space_1)
      @board.add(space_2)

      assert_equal space_1, @board.at(1, 1)
      assert_equal space_2, @board.at(2, 4)
      assert_equal nil, @board.at(3, 1)
    end
  end

end
