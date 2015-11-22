require 'test_helper'
require 'chinese_checkers/move'
require 'chinese_checkers/piece'

module ChineseCheckers
  class MoveTest < Minitest::Test
    def test_it_is_valid_if_space_is_available_and_validator_aproves_it
      left_move = Move.new(
        piece: Piece.new(x: 3, y: 4),
        space: available_space(4, 9),
        validator: weak_validator
      )
      assert left_move.perform
    end

    def test_it_is_not_valid_if_validator_does_not_aprove_it
      left_move = Move.new(
        piece: Piece.new(x: 3, y: 4),
        space: available_space(9, 2),
        validator: strict_validator
      )
      refute left_move.perform
    end

    def test_it_changes_the_position_of_the_piece_to_9_2_if_validator_aproves_it
      piece = Piece.new(x: 3, y: 2)
      left_move = Move.new(
        piece: piece,
        space: available_space(9, 2),
        validator: weak_validator
      )
      left_move.perform
      assert_equal 9, piece.x
      assert_equal 2, piece.y
    end

    def test_it_changes_the_position_of_the_piece_to_7_1_if_validator_aproves_it
      piece = Piece.new(x: 3, y: 2)
      left_move = Move.new(
        piece: piece,
        space: available_space(7, 1),
        validator: weak_validator
      )
      left_move.perform
      assert_equal 7, piece.x
      assert_equal 1, piece.y
    end

    def test_it_does_not_change_the_position_of_the_piece_if_validator_does_not_allow_it
      piece = Piece.new(x: 3, y: 2)
      left_move = Move.new(
        piece: piece,
        space: available_space(7, 1),
        validator: strict_validator
      )
      left_move.perform
      assert_equal 3, piece.x
      assert_equal 2, piece.y
    end

  private

    def available_space(x, y)
      Struct.new(:available?, :x, :y).new(true, x, y)
    end

    def unavailable_space(x, y)
      Struct.new(:available?, :x, :y).new(false, x, y)
    end

    def weak_validator
      Struct.new :_ do
        def valid?(piece, space)
          true
        end
      end.new
    end

    def strict_validator
      Struct.new :_ do
        def valid?(piece, space)
          false
        end
      end.new
    end

  end
end
