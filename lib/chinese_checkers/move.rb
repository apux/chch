module ChineseCheckers
  class Move
    def initialize(from:, to:, validator:)
      @from      = from
      @to        = to
      @validator = validator
    end

    def perform
      valid? ? move_piece : false
    end

  private

    def valid?
      @validator.valid?(@from, @to)
    end

    def move_piece
      @to.put @from.remove_piece
      true
    end
  end
end
