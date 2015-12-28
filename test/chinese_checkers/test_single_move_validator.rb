require 'test_helper'
require 'chinese_checkers/space'
require 'chinese_checkers/piece'
require 'chinese_checkers/single_move_validator'

module ChineseCheckers
  class TestSingleMoveValidator < Minitest::Test
    def test_it_is_valid_if_from_has_a_piece_to_is_available_and_spaces_are_adjacent
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

      from = space_with_piece(x, y)

      adjacent_values.each do |a, b|
        to = available_space(a, b)

        validator = SingleMoveValidator.new

        assert validator.valid?(from: from, to: to), "It is not valid when from has a piece, to is available and spaces are adjacent."
      end
    end

    def test_it_is_not_valid_if_from_is_nil
      from = nil
      to = available_space(10, 4)

      validator = SingleMoveValidator.new

      refute validator.valid?(from: from, to: to), "It is valid when from is nil."
    end

    def test_it_is_not_valid_if_from_does_not_have_a_piece
      from = available_space(9, 3)
      to = available_space(10, 4)

      validator = SingleMoveValidator.new

      refute validator.valid?(from: from, to: to), "It is valid when from does not have a piece."
    end

    def test_it_is_not_valid_if_to_is_nil
      from = space_with_piece(9, 3)
      to = nil

      validator = SingleMoveValidator.new

      refute validator.valid?(from: from, to: to), "It is valid when to is nil."
    end

    def test_it_is_not_valid_if_to_is_not_available
      from = space_with_piece(9, 3)
      to = space_with_piece(10, 4)

      validator = SingleMoveValidator.new

      refute validator.valid?(from: from, to: to), "It is valid when to is not available."
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
      from = space_with_piece(x, y)

      adjacent_values.each do |a, b|
        to = available_space(a, b)

        validator = SingleMoveValidator.new

        refute validator.valid?(from: from, to: to), "It is valid when spaces are not adjacent."
      end
    end

  private

    def space_with_piece(x, y)
      Struct.new(:has_a_piece?, :available?, :x, :y).new(true, false, x, y)
    end

    def available_space(x, y)
      Struct.new(:has_a_piece?, :available?, :x, :y).new(false, true, x, y)
    end
  end
end
