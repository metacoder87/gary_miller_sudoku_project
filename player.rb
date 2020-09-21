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

    def get_position
        puts "#{@player}, input coordinates of a value you would like to change..."
        pos = gets.chomp.split(" ").map(&:to_i)
        pos.map! do |num| 
            if (1..3).to_a.include?(num)
                num += 1
            elsif (4..6).to_a.include?(num)
                num += 2
            else num += 3
            end
        end
    end

