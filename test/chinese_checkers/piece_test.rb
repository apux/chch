require 'test_helper'
require 'chinese_checkers/piece'

module ChineseCheckers
  class PieceTest < Minitest::Test
    def test_it_stores_x_position
      piece = Piece.new(x: 4, y: 7)
      assert_equal 4, piece.x
    end
  end
end
