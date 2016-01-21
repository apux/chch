module ChineseCheckers

  class TurnRule
    attr_accessor :player

    def initialize(player:, previous_move: nil)
      @player = player
      @previous_move = previous_move
    end

    def valid?(move)
      player_turn? and (first_move? or previous_move_was_a_jump?)
    end

    def player_turn?
      move.piece_color == @player
    end
  end

end
