require 'test_helper'
require 'chinese_checkers/piece'

module ChineseCheckers
  class TestPiece < Minitest::Test
    def test_it_stores_x_y_and_color
      piece = Piece.new(x: 4, y: 7, color: :red)

      assert_equal 4, piece.x
      assert_equal 7, piece.y
      assert_equal :red, piece.color
    end

    def test_it_can_be_created_with_no_color_and_position
      piece = Piece.new

      assert_equal nil, piece.x
      assert_equal nil, piece.y
      assert_equal nil, piece.color
    end

    def test_it_allows_to_modify_x_y_and_color
      piece = Piece.new(x: 4, y: 7, color: :red)
      piece.x = 5
      piece.y = 1
      piece.color = :green

      assert_equal 5, piece.x
      assert_equal 1, piece.y
      assert_equal :green, piece.color
    end
  end
end
