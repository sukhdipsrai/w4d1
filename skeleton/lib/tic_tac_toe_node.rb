require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :children, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @children = []
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def op
    if next_mover_mark == :x
      return :o
    else 
      return :x
    end
  end

  def children
    children = []
    (0...3).each do |index|
      (0...3).each do |j|
        if board.empty?([index, j])
          duplication = board.dup
          duplication([index, j]) = next_mover_mark
          children << TicTacToeNode.new(duplication, op, prev_move_pos)
          # children = Array.new(9)
        end
      end
    end
    children
  end



end
