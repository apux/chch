require 'test_helper'
require 'chinese_checkers/rules'

module ChineseCheckers
  class TestRules < Minitest::Test
    def setup
      @rules = Rules.new
      @move = Struct.new(:from, :to).new(Object.new, Object.new)
    end

    def test_it_is_valid_with_one_valid_rule
      @rules.add ValidRule.new
      assert @rules.valid?(@move), "It is not valid when has one valid rule"
    end

    def test_it_is_not_valid_with_one_not_valid_rule
      @rules.add InvalidRule.new
      refute @rules.valid?(@move), "It is valid when has one invalid rule"
    end

    def test_it_is_not_valid_with_an_invalid_and_a_valid_rule
      @rules.add InvalidRule.new
      @rules.add ValidRule.new
      refute @rules.valid?(@move), "It is valid when has one invalid rule"
    end

    def test_it_is_not_valid_with_a_valid_and_an_invalid_rule
      @rules.add ValidRule.new
      @rules.add InvalidRule.new
      refute @rules.valid?(@move), "It is valid when has one invalid rule"
    end

    def test_rules_receive_message_to_valid_with_move_as_param
      rule_1 = Minitest::Mock.new
      rule_2 = Minitest::Mock.new
      rule_1.expect :valid?, true, [@move]
      rule_2.expect :valid?, true, [@move]
      @rules.add rule_1
      @rules.add rule_2
      @rules.valid?(@move)
      rule_1.verify
      rule_2.verify
    end
  end

  class ValidRule
    def valid?(_)
      true
    end
  end

  class InvalidRule
    def valid?(_)
      false
    end
  end
end
