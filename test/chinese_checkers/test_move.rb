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
      move = Move.new(from: @from, to: @to, validator: permissive_validator)

      assert move.perform, "It is not possible to move to an available space with permissive validator."
      assert_nil @from.piece
      assert @to.piece, "Piece was not moved."
    end

    def test_it_does_not_move_the_piece_if_validator_does_not_allow_it
      move = Move.new(from: @from, to: @to, validator: strict_validator)

      refute move.perform, "It is possible to move even though validator does not permit it."
      assert @from.piece, "Piece was removed."
      assert_nil @to.piece
    end

    def test_piece_color_is_red_when_froms_piece_is_red
      from = Struct.new(:piece).new(Struct.new(:color).new(:red))
      move = Move.new(from: from, to: nil, validator: nil)

      assert_equal :red, move.piece_color
    end

    def test_piece_color_is_green_when_froms_piece_is_green
      from = Struct.new(:piece).new(Struct.new(:color).new(:green))
      move = Move.new(from: from, to: nil, validator: nil)

      assert_equal :green, move.piece_color
    end

    def test_piece_color_returns_nil_if_from_has_no_piece
      from = Struct.new(:piece).new(nil)
      move = Move.new(from: from, to: nil, validator: nil)

      assert_nil move.piece_color
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
