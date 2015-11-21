require 'test_helper'
require 'chinese_checkers/left_move'
require 'chinese_checkers/piece'

module ChineseCheckers
  class LeftMoveTest < Minitest::Test
    def test_it_is_not_valid_if_space_is_not_available
      left_move = LeftMove.new(
        piece: Piece.new(x: 3, y: 4),
        space: not_empty_space,
        validator: weak_validator,
      )
      refute left_move.perform
    end

    def test_it_is_valid_if_space_is_available_and_valitor_aproves_it
      left_move = LeftMove.new(
        piece: Piece.new(x: 3, y: 4),
        space: empty_space(9, 2),
        validator: weak_validator
      )
      assert left_move.perform
    end

    def test_it_is_not_valid_if_space_is_available_but_valitor_does_not_aprove_it
      left_move = LeftMove.new(
        piece: Piece.new(x: 3, y: 4),
        space: empty_space(9, 2),
        validator: strict_validator
      )
      refute left_move.perform
    end

    def test_it_changes_the_position_of_the_piece_to_9_2
      piece = Piece.new(x: 3, y: 2)
      left_move = LeftMove.new(
        piece: piece,
        space: empty_space(9, 2),
        validator: weak_validator
      )
      left_move.perform
      assert_equal 9, piece.x
      assert_equal 2, piece.y
    end

    def test_it_changes_the_position_of_the_piece_to_7_1
      piece = Piece.new(x: 3, y: 2)
      left_move = LeftMove.new(
        piece: piece,
        space: empty_space(7, 1),
        validator: weak_validator
      )
      left_move.perform
      assert_equal 7, piece.x
      assert_equal 1, piece.y
    end

  private

    def not_empty_space
      Struct.new(:available?, :x, :y).new(false)
    end

    def empty_space(x, y)
      Struct.new(:available?, :x, :y).new(true, x, y)
    end

    def weak_validator
      Struct.new(:valid?, :piece, :space).new(true)
    end

    def strict_validator
      Struct.new(:valid?, :piece, :space).new(false)
    end
  end
end
