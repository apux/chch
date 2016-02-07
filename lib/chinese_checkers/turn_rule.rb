module ChineseCheckers

  class TurnRule
    attr_accessor :player

    def initialize(player:, previous_move: nil)
      @player = player
      @previous_move = previous_move
    end

    def valid?(move)
      move.piece_color == @player
    end
  end

end
