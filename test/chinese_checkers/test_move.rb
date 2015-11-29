require 'test_helper'
require 'chinese_checkers/move'
require 'chinese_checkers/space'

module ChineseCheckers
  class TestMove < Minitest::Test
    def test_it_is_valid_if_space_is_available_and_validator_aproves_it
      left_move = Move.new(
        from: Space.new(x: 3, y: 4),
        to: available_space(4, 9),
        validator: weak_validator
      )
      assert left_move.perform
    end

    def test_it_is_not_valid_if_validator_does_not_aprove_it
      left_move = Move.new(
        from: Space.new(x: 3, y: 4),
        to: available_space(9, 2),
        validator: strict_validator
      )
      refute left_move.perform
    end

    def test_it_changes_the_position_of_the_space_to_9_2_if_validator_aproves_it
      space = Space.new(x: 3, y: 2)
      left_move = Move.new(
        from: space,
        to: available_space(9, 2),
        validator: weak_validator
      )
      left_move.perform
      assert_equal 9, space.x
      assert_equal 2, space.y
    end

    def test_it_changes_the_position_of_the_space_to_7_1_if_validator_aproves_it
      space = Space.new(x: 3, y: 2)
      left_move = Move.new(
        from: space,
        to: available_space(7, 1),
        validator: weak_validator
      )
      left_move.perform
      assert_equal 7, space.x
      assert_equal 1, space.y
    end

    def test_it_does_not_change_the_position_of_the_space_if_validator_does_not_allow_it
      space = Space.new(x: 3, y: 2)
      left_move = Move.new(
        from: space,
        to: available_space(7, 1),
        validator: strict_validator
      )
      left_move.perform
      assert_equal 3, space.x
      assert_equal 2, space.y
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
        def valid?(_, _)
          true
        end
      end.new
    end

    def strict_validator
      Struct.new :_ do
        def valid?(_, _)
          false
        end
      end.new
    end

  end
end
