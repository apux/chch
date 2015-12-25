require 'test_helper'
require 'chinese_checkers/move'
require 'chinese_checkers/space'

module ChineseCheckers
  class TestMove < Minitest::Test

    class PermissiveValidator
      def valid?(_, _); true; end
    end

    class StrictValidator
      def valid?(_, _); false; end
    end

    def test_perform_is_true_if_space_is_available_and_validator_aproves_it
      left_move = Move.new(
        from:       Space.new(x: 3, y: 4),
        to:         Space.new(x: 4, y: 9),
        validator:  permissive_validator
      )
      assert left_move.perform, "It is not possible to move to an available space with permissive validator."
    end

    def test_perform_is_false_if_validator_does_not_aprove_it
      left_move = Move.new(
        from:       Space.new(x: 3, y: 4),
        to:         Space.new(x: 9, y: 2),
        validator:  strict_validator
      )
      refute left_move.perform, "It is possible to move even though validator does not permit it."
    end

    def test_perform_moves_the_piece_if_validator_aproves_it
      from = Space.new(x: 3, y: 2, piece: Minitest::Mock.new)
      to = Space.new(x: 9, y: 2)
      left_move = Move.new(
        from:       from,
        to:         to,
        validator:  permissive_validator
      )
      left_move.perform
      assert_nil from.piece
      assert to.piece
    end

    def test_it_does_not_move_the_piece_if_validator_does_not_allow_it
      from = Space.new(x: 3, y: 2, piece: Minitest::Mock.new)
      to = Space.new(x: 9, y: 2)
      left_move = Move.new(
        from:       from,
        to:         to,
        validator:  strict_validator
      )
      left_move.perform
      assert from.piece
      assert_nil to.piece
    end

  private

    def permissive_validator
      PermissiveValidator.new
    end

    def strict_validator
      StrictValidator.new
    end

  end
end
