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

    def piece_color
      @from.piece.color if @from.piece
    end

  private

    def move_piece
      @to.put @from.remove_piece
    end
  end

end
