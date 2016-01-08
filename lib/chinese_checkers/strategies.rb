module ChineseCheckers
  class Strategies
    def initialize
      @strategies = []
    end

    def add(strategy)
      @strategies << strategy
    end

    def valid?(move)
      @strategies.any?{ |s| s.valid?(move) }
    end
  end
end
