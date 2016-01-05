require 'test_helper'
require 'chinese_checkers/move'
require 'chinese_checkers/space'

module ChineseCheckers

  class TestMove < Minitest::Test

    class PermissiveValidator
      attr_reader :from, :to
      def valid?(_); true; end
    end

    class StrictValidator
      attr_reader :from, :to
      def valid?(_); false; end
    end

    def setup
      @from = Space.new(x: 3, y: 4, piece: Object.new)
      @to = Space.new(x: 4, y: 9)
    end

    def test_perform_moves_the_piece_if_validator_aproves_it
      left_move = Move.new(from: @from, to: @to, validator: permissive_validator)

      assert left_move.perform, "It is not possible to move to an available space with permissive validator."
      assert_nil @from.piece
      assert @to.piece, "Piece was not moved."
    end

    def test_it_does_not_move_the_piece_if_validator_does_not_allow_it
      left_move = Move.new(from: @from, to: @to, validator: strict_validator)

      refute left_move.perform, "It is possible to move even though validator does not permit it."
      assert @from.piece, "Piece was removed."
      assert_nil @to.piece
    end

  private

    def permissive_validator
      PermissiveValidator.new
    end

    def strict_validator
      StrictValidator.new
    end
  end

end
