            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/gary_miller_sudoku_project


require_relative 'player'
require_relative 'board'

class Game

    attr_reader :board, :player

    def initialize(puzzle)
        @board = Board.new(puzzle)
        @player = Player.new
    end

    def play

    end

    def solved?

    end

    def render

    end

    def prompt

    end

    def edit_pos(val)

    end

    def