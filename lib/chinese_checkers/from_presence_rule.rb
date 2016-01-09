module ChineseCheckers
  class FromPresenceRule
    def valid?(move)
      move.from and move.from.has_a_piece?
    end
  end
end
