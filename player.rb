            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/gary_miller_sudoku_project


class Player

    attr_reader :player

    def initialize
        @player = get_name
    end

    def get_name
        puts "What is the players name?"
        gets.chomp.to_s.capitalize
    end

