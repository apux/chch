require 'test_helper'
require 'chinese_checkers/from_presence_rule'
require 'chinese_checkers/space'

module ChineseCheckers
  class TestFromPresenceRule < Minitest::Test
    def test_is_valid_if_moves_from_has_a_piece
      rule = FromPresenceRule.new
      space = Struct.new(:has_a_piece?).new(true)
      move = Struct.new(:from).new(space)
      assert rule.valid?(move), "It is not valid when move's from has a piece"
    end

    def test_is_not_valid_if_moves_from_does_not_have_a_piece
      rule = FromPresenceRule.new
      space = Struct.new(:has_a_piece?).new(false)
      move = Struct.new(:from).new(space)
      refute rule.valid?(move), "It is valid when move's from does not have a piece"
    end

    def test_is_not_valid_if_moves_from_is_nil
      rule = FromPresenceRule.new
      space = nil
      move = Struct.new(:from).new(space)
      refute rule.valid?(move), "It is valid when move's from does not have a piece"
    end
  end
end
