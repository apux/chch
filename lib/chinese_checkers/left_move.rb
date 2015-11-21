module ChineseCheckers
  class LeftMove
    def initialize(piece:, space:, validator:)
      @piece = piece
      @space = space
      @validator = validator
      @validator.piece = piece
      @validator.space = space
    end

    def perform
      if @space.available? and @validator.valid?
        @piece.x = @space.x
        @piece.y = @space.y
        true
      else
        false
      end
    end
  end
end
