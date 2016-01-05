module ChineseCheckers

  class Move
    attr_reader :from, :to

    def initialize(from:, to:, validator:)
      @from      = from
      @to        = to
      @validator = validator
    end

    def perform
      if @validator.valid?(self)
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
