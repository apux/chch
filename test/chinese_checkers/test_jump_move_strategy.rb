require 'test_helper'
require 'chinese_checkers/jump_move_strategy'

module ChineseCheckers

  class TestJumpMoveStrategy < Minitest::Test
    def test_it_is_valid_if_from_is_four_spaces_to_the_left_and_has_a_piece_in_the_middle
      board = Minitest::Mock.new
      board.expect :at, space_with_piece(0, 0), [11, 3]
      move = create_move(13, 3, 9, 3)
      strategy = JumpMoveStrategy.new board: board
      assert strategy.valid?(move), "It is not valid if from is 4 spaces to the left and has a piece in the middle."
      board.verify
    end

    def test_it_is_not_valid_if_from_is_six_spaces_to_the_left
      board = Minitest::Mock.new
      board.expect :at, space_with_piece(13, 3), [13, 3]
      move = create_move(15, 3, 9, 3)
      strategy = JumpMoveStrategy.new board: board
      refute strategy.valid?(move), "It is valid when is six spaces to the left."
    end

    def test_it_is_valid_if_from_is_four_spaces_to_the_right_and_has_a_piece_in_the_middle
      board = Minitest::Mock.new
      board.expect :at, space_with_piece(11, 3), [11, 3]
      move = create_move(9, 3, 13, 3)
      strategy = JumpMoveStrategy.new board: board
      assert strategy.valid?(move), "It is not valid if from is 4 spaces to the right and has a piece in the middle."
      board.verify
    end

    def test_it_is_not_valid_if_from_is_six_spaces_to_the_right
      board = Minitest::Mock.new
      board.expect :at, space_with_piece(11, 3), [11, 3]
      move = create_move(9, 3, 15, 3)
      strategy = JumpMoveStrategy.new board: board
      refute strategy.valid?(move), "It is valid when is six spaces to the right."
    end

    def test_it_is_valid_if_from_is_two_spaces_to_the_left_and_two_spaces_to_the_bottom_and_has_a_piece_in_the_middle
      board = Minitest::Mock.new
      board.expect :at, space_with_piece(10, 4), [10, 4]
      move = create_move(11, 3, 9, 5)
      strategy = JumpMoveStrategy.new board: board
      assert strategy.valid?(move), "It is not valid if from is 2 spaces to the left and 2 spaces to the bottom and has a piece in the middle."
      board.verify
    end

    def test_it_is_not_valid_if_from_is_three_spaces_to_the_left_and_three_spaces_to_the_bottom
      board = Minitest::Mock.new
      board.expect :at, space_with_piece(11, 4), [11, 4]
      move = create_move(13, 3, 9, 5)
      strategy = JumpMoveStrategy.new board: board
      refute strategy.valid?(move), "It is valid if from is 3 spaces to the left and 3 spaces to the bottom."
    end

    def test_it_is_valid_if_from_is_two_spaces_to_the_right_and_two_spaces_to_the_bottom_and_has_a_piece_in_the_middle
      board = Minitest::Mock.new
      board.expect :at, space_with_piece(10, 4), [10, 4]
      move = create_move(9, 3, 11, 5)
      strategy = JumpMoveStrategy.new board: board
      assert strategy.valid?(move), "It is not valid if from is 2 spaces to the right and 2 spaces to the bottom and has a piece in the middle."
      board.verify
    end

    def test_it_is_not_valid_if_from_is_three_spaces_to_the_right_and_three_spaces_to_the_bottom
      board = Minitest::Mock.new
      board.expect :at, space_with_piece(11, 4), [11, 4]
      move = create_move(9, 3, 13, 5)
      strategy = JumpMoveStrategy.new board: board
      refute strategy.valid?(move), "It is valid if from is 3 spaces to the right and 3 spaces to the bottom."
    end

    def test_it_is_valid_if_from_is_two_spaces_to_the_left_and_two_spaces_to_the_top_and_has_a_piece_in_the_middle
      board = Minitest::Mock.new
      board.expect :at, space_with_piece(10, 4), [10, 4]
      move = create_move(11, 5, 9, 3)
      strategy = JumpMoveStrategy.new board: board
      assert strategy.valid?(move), "It is not valid if from is 2 spaces to the left and 2 spaces to the top and has a piece in the middle."
      board.verify
    end

    def test_it_is_not_valid_if_from_is_three_spaces_to_the_left_and_three_spaces_to_the_top
      board = Minitest::Mock.new
      board.expect :at, space_with_piece(10, 4), [10, 4]
      move = create_move(12, 6, 9, 3)
      strategy = JumpMoveStrategy.new board: board
      refute strategy.valid?(move), "It is valid if from is 3 spaces to the left and 3 spaces to the top and has a piece in the middle."
    end

    def test_it_is_valid_if_from_is_two_spaces_to_the_right_and_two_spaces_to_the_top_and_has_a_piece_in_the_middle
      board = Minitest::Mock.new
      board.expect :at, space_with_piece(10, 4), [10, 4]
      move = create_move(9, 5, 11, 3)
      strategy = JumpMoveStrategy.new board: board
      assert strategy.valid?(move), "It is not valid if from is 2 spaces to the right and 2 spaces to the top and has a piece in the middle."
      board.verify
    end

    def test_it_is_not_valid_if_from_is_three_spaces_to_the_right_and_three_spaces_to_the_top
      board = Minitest::Mock.new
      board.expect :at, space_with_piece(10, 4), [10, 4]
      move = create_move(8, 6, 11, 3)
      strategy = JumpMoveStrategy.new board: board
      refute strategy.valid?(move), "It is valid if from is 3 spaces to the right and 3 spaces to the top and has a piece in the middle."
    end

  private

    def create_move(x1, y1, x2, y2)
      from = space_with_piece(x1, y1)
      to = available_space(x2, y2)
      move = Struct.new(:from, :to).new(from, to)
    end

    def space_with_piece(x, y)
      Struct.new(:x, :y, :has_a_piece?).new(x, y, true)
    end

    def available_space(x, y)
      Struct.new(:x, :y, :has_a_piece?).new(x, y, false)
    end
  end

end
