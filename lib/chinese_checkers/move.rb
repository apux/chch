module ChineseCheckers
  class Move
    def initialize(piece:, space:, validator:)
      @piece = piece
      @space = space
      @validator = validator
    end

    def perform
      valid? ? (update_piece_position and true) : false
    end

  private

    def valid?
      @validator.valid?(@piece, @space)
    end

    def update_piece_position
      @piece.x = @space.x
      @piece.y = @space.y
    end
  end
end
