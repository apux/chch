module ChineseCheckers
  class ToAvailableRule
    def valid?(move)
      move.to and move.to.available?
    end
  end
end
