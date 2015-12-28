module ChineseCheckers
  class Move
    def initialize(from:, to:, validator:)
      @from      = from
      @to        = to
      @validator = validator
    end

    def perform
      if @validator.valid?(from: @from, to: @to)
        move_piece
        true
      else
        false
      end
    end

  private

    def move_piece
      @to.put @from.remove_piece
    end
  end
end
