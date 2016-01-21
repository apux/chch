require 'test_helper'
require 'chinese_checkers/turn_rule'

module ChineseCheckers

  class TestTurnRule < Minitest::Test
    def test_it_is_valid_if_it_is_the_player_turn
      move = Struct.new(:piece_color).new(:red)
      turn = TurnRule.new player: :red
      assert turn.valid?(move), "It is not valid when it is the player turn."
    end

    def test_it_is_not_valid_if_player_is_of_other_color
      move = Struct.new(:piece_color).new(:red)
      turn = TurnRule.new player: :green
      refute turn.valid?(move), "It is valid when player is of other color."
    end
  end

end
