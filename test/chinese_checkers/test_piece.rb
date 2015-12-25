require 'test_helper'
require 'chinese_checkers/piece'
require 'chinese_checkers/space'

module ChineseCheckers

  class TestPiece < Minitest::Test
    def test_it_stores_color
      piece = Piece.new(color: :red)

      assert_equal :red, piece.color
    end
  end

end
