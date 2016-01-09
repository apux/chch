require 'test_helper'
require 'chinese_checkers/to_available_rule'

module ChineseCheckers
  class TestToAvailableRule < Minitest::Test
    def test_it_is_valid_if_to_is_available
      rule = ToAvailableRule.new
      to = Struct.new(:available?).new(true)
      move = Struct.new(:to).new(to)
      assert rule.valid?(move), "It is not valid when to is available"
    end

    def test_it_is_not_valid_if_to_is_not_available
      rule = ToAvailableRule.new
      to = Struct.new(:available?).new(false)
      move = Struct.new(:to).new(to)
      refute rule.valid?(move), "It is valid when to is not available"
    end

    def test_it_is_not_valid_if_to_is_nil
      rule = ToAvailableRule.new
      to = nil
      move = Struct.new(:to).new(to)
      refute rule.valid?(move), "It is valid when to is not available"
    end
  end
end
