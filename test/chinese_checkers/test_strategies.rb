require 'test_helper'
require 'chinese_checkers/strategies'

module ChineseCheckers
  class TestStrategies < Minitest::Test
    def setup
      @move = Struct.new(:from, :to).new(Object.new, Object.new)
      @strategies = Strategies.new
    end

    def test_it_is_valid_with_a_valid_strategy
      @strategies.add ValidStrategy.new
      assert @strategies.valid?(@move), "It is invalid with a valid strategy."
    end

    def test_it_is_not_valid_with_an_invalid_strategy
      @strategies.add InvalidStrategy.new
      refute @strategies.valid?(@move), "It is valid with an invalid strategy."
    end

    def test_it_is_valid_with_a_valid_and_an_invalid_strategy
      @strategies.add ValidStrategy.new
      @strategies.add InvalidStrategy.new
      assert @strategies.valid?(@move), "It is valid with a valid and an invalid strategy."
    end

    def test_it_is_valid_with_an_invalid_and_a_valis_strategy
      @strategies.add InvalidStrategy.new
      @strategies.add ValidStrategy.new
      assert @strategies.valid?(@move), "It is valid with an invalid and a valid strategy."
    end

    def test_it_calls_valid_in_all_strategies_with_the_move_param
      strategy_1 = Minitest::Mock.new
      strategy_2 = Minitest::Mock.new
      strategy_1.expect :valid?, false, [@move]
      strategy_2.expect :valid?, true, [@move]
      @strategies.add strategy_1
      @strategies.add strategy_2
      @strategies.valid?(@move)
      strategy_1.verify
      strategy_2.verify
    end
  end

  class ValidStrategy
    def valid?(_)
      true
    end
  end

  class InvalidStrategy
    def valid?(_)
      false
    end
  end
end
