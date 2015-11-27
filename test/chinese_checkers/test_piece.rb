require 'test_helper'
require 'chinese_checkers/piece'
require 'chinese_checkers/space'

module ChineseCheckers
  class TestPiece < Minitest::Test
    def test_it_stores_x_y_and_color
      space = Space.new(x: 5, y: 8)
      piece = Piece.new(space: space, color: :red)

      assert_equal :red, piece.color
      assert_equal space, piece.space
    end

    def test_it_can_be_created_with_no_color_and_space
      piece = Piece.new

      assert_equal nil, piece.space
      assert_equal nil, piece.color
    end

    def test_it_allows_to_modify_space_and_color
      piece = Piece.new(space: Space.new(x: 2, y: 3), color: :red)
      new_space = Space.new(x: 5, y: 8)
      piece.space = new_space
      piece.color = :green

      assert_equal new_space, piece.space
      assert_equal :green, piece.color
    end
  end
end
