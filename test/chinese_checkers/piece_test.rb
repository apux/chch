require 'test_helper'
require 'chinese_checkers/piece'

module ChineseCheckers
  class PieceTest < Minitest::Test
    def test_it_stores_x_position
      piece = Piece.new(x: 4, y: 7)
      assert_equal 4, piece.x
    end

    def test_it_stores_y_position
      piece = Piece.new(x: 4, y: 7)
      assert_equal 7, piece.y
    end

    def test_it_stores_color
      piece = Piece.new(x: 4, y: 7, color: :red)
      assert_equal :red, piece.color
    end

    def test_it_allows_to_modify_x
      piece = Piece.new(x: 4, y: 7)
      piece.x = 5
      assert_equal 5, piece.x
    end

    def test_it_allows_to_modify_y
      piece = Piece.new(x: 4, y: 7)
      piece.y = 1
      assert_equal 1, piece.y
    end

    def test_it_allows_to_modify_color
      piece = Piece.new(x: 4, y: 7, color: :red)
      piece.color = :green
      assert_equal :green, piece.color
    end
  end
end
