require 'test_helper'
require 'chinese_checkers/move_validator'

module ChineseCheckers

  class TestMoveValidator < Minitest::Test
    def test_it_is_valid_if_rules_and_strategies_are_valid
      rules = Minitest::Mock.new
      strategies = Minitest::Mock.new
      move = Object.new

      validator = MoveValidator.new rules: rules, strategies: strategies
      rules.expect :valid?, true, [move]
      strategies.expect :valid?, true, [move]

      assert validator.valid?(move), "It is not valid when both rules and strategies are valid."
      rules.verify
      strategies.verify
    end

    def test_it_is_not_valid_if_rules_is_valid_but_strategies_isnt
      rules = Minitest::Mock.new
      strategies = Minitest::Mock.new
      move = Object.new

      validator = MoveValidator.new rules: rules, strategies: strategies
      rules.expect :valid?, true, [move]
      strategies.expect :valid?, false, [move]

      refute validator.valid?(move), "It is valid when strategies is not valid."
      rules.verify
      strategies.verify
    end

    def test_it_is_not_valid_if_rules_is_not_valid
      rules = Minitest::Mock.new
      strategies = Minitest::Mock.new
      move = Object.new

      validator = MoveValidator.new rules: rules, strategies: strategies
      rules.expect :valid?, false, [move]

      refute validator.valid?(move), "It is valid when rules is not valid."
      rules.verify
    end
  end

end
