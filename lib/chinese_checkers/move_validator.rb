module ChineseCheckers

  class MoveValidator
    def initialize(rules:, strategies:)
      @rules      = rules
      @strategies = strategies
    end

    def valid?(move)
      rules.valid?(move) and strategies.valid?(move)
    end

  private

    attr_reader :rules, :strategies

  end
end
