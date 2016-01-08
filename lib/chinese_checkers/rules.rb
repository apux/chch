module ChineseCheckers
  class Rules
    def initialize
      @rules = []
    end

    def add(rule)
      @rules << rule
    end

    def valid?(move)
      @rules.all?{ |r| r.valid?(move) }
    end
  end
end
