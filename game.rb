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
        until @board.solved? == true
            system 'clear'
            @board.render
            @board.edit_val(@player.get_position, @player.get_value.to_i)
            @board.render
        end
        puts "Congrats #{@player.player}, you solved that sudoku."
    end

end

game = Game.new("sudoku1_almost.txt")
game.play

            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/gary_miller_sudoku_project