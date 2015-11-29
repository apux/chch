module ChineseCheckers
  class Move
    def initialize(from:, to:, validator:)
      @from = from
      @to = to
      @validator = validator
    end

    def perform
      valid? ? (update_piece_position and true) : false
    end

  private

    def valid?
      @validator.valid?(@from, @to)
    end

    def update_piece_position
      @from.x = @to.x
      @from.y = @to.y
    end
  end
end
