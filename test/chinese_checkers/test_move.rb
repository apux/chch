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

    def test_it_is_valid_if_space_is_available_and_validator_aproves_it
      left_move = Move.new(
        from:       Space.new(x: 3, y: 4),
        to:         Space.new(x: 4, y: 9),
        validator:  permissive_validator
      )
      assert left_move.perform, "It's not possible to move to an available space with permissive validator."
    end

    def test_it_is_not_valid_if_validator_does_not_aprove_it
      left_move = Move.new(
        from:       Space.new(x: 3, y: 4),
        to:         Space.new(x: 9, y: 2),
        validator:  strict_validator
      )
      refute left_move.perform, "It's possible to move even though validator does not permit it."
    end

    def test_it_changes_the_position_of_the_space_to_9_2_if_validator_aproves_it
      space = Space.new(x: 3, y: 2)
      left_move = Move.new(
        from:       space,
        to:         Space.new(x: 9, y: 2),
        validator:  permissive_validator
      )
      left_move.perform
      assert_equal 9, space.x
      assert_equal 2, space.y
    end

    def test_it_changes_the_position_of_the_space_to_7_1_if_validator_aproves_it
      space = Space.new(x: 3, y: 2)
      left_move = Move.new(
        from:       space,
        to:         Space.new(x: 7, y: 1),
        validator:  permissive_validator
      )
      left_move.perform
      assert_equal 7, space.x
      assert_equal 1, space.y
    end

    def test_it_does_not_change_the_position_of_the_space_if_validator_does_not_allow_it
      space = Space.new(x: 3, y: 2)
      left_move = Move.new(
        from:       space,
        to:         Space.new(x: 7, y: 1),
        validator:  strict_validator
      )
      left_move.perform
      assert_equal 3, space.x
      assert_equal 2, space.y
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
