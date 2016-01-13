require 'test_helper'
require 'chinese_checkers/single_move_strategy'

module ChineseCheckers
  class TestSingleMoveStrategy < Minitest::Test
    def test_it_is_valid_if_from_and_two_are_adjacent
      x = 12
      y = 7
      adjacent_values = [
        [11, 6],
        [13, 6],
        [11, 8],
        [13, 8],
        [10, 7],
        [14, 7],
      ]

      from = Struct.new(:x, :y).new(x, y)

      adjacent_values.each do |a, b|
        to = Struct.new(:x, :y).new(a, b)

        strategy = SingleMoveStrategy.new
        move = Struct.new(:from, :to).new(from, to)

        assert strategy.valid?(move), "It is not valid when from has a piece, to is available and spaces are adjacent."
      end
    end

    def test_it_is_not_valid_if_spaces_are_not_adjacent
      x = 12
      y = 7
      adjacent_values = [
        [110, 6],
        [13, 60],
        [10, 8],
        [14, 8],
        [11, 7],
        [13, 7],
      ]
      from = Struct.new(:x, :y).new(x, y)

      adjacent_values.each do |a, b|
        to = Struct.new(:x, :y).new(a, b)

        strategy = SingleMoveStrategy.new
        move = Struct.new(:from, :to).new(from, to)

        refute strategy.valid?(move), "It is valid when spaces are not adjacent."
      end
    end

  private

    def space_with_piece(x, y)
    end

    def available_space(x, y)
      Struct.new(:x, :y).new(x, y)
    end

  end
end
