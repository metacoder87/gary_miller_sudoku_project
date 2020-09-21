            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/gary_miller_sudoku_project


require 'byebug'
require "colorize"
require_relative "tile"

class Board


    def from_file
        IO.readlines(@puzzle).each { |line| @grid << line.chomp.split("") }
    end

    attr_accessor :puzzle, :grid, :tiles

    def initialize(puzzle)
        @puzzle = "puzzles/" + puzzle
        @grid = []
        from_file
        build
        @tiles = {}
        fill_tiles
        color_fill
    end

    def vert_split
        @grid.each { |line| line.insert(1, "|") && line.insert(5, "|") && line.insert(9, "|") }
    end

    def dash_line
        ("-" * 13).split("")
    end

    def horz_split
        @grid.insert(1, dash_line) && @grid.insert(5, dash_line) && @grid.insert(9, dash_line)
    end

    def split_blocks
        vert_split && horz_split
    end

    def col_key
        @grid.unshift((1..9).map { |num| num })
    end

    def row_key
        key = 0
        @grid.each { |line| line.unshift(key) && key += 1 }
    end

    def input_key
        col_key && row_key
    end

    def build
        input_key && split_blocks
    end

    def fill_tiles
        @grid.each_with_index { |row, idx| row.each_with_index { |ele, i| ele == "0" ? @tiles[[idx,i]] = Tile.new(ele.green, false) : @tiles[[idx,i]] = Tile.new(ele.red, true) if idx > 0 && i > 0 && ele != "-" && ele != "|" } }
    end

    def color_fill
        @grid.each_with_index { |line, idx| line.each_with_index { |ele, i| @grid[idx][i] = @tiles[[idx,i]].value if @tiles.keys.include?([idx,i]) } }
    end
                    
    def edit_val(position, new_val)
        @grid[position[0]][position[1]] = @tiles[position].change(new_val.to_s.green) 
    end

    def render
       @grid.each { |line| puts line.join(" ") }
    end

    def rows
        row_vals = {}
        @tiles.keys.each { |spot| row_vals.include?(spot[0]) ? row_vals[spot[0]] << @tiles.values_at(spot)[0].value.uncolorize.to_i : row_vals[spot[0]] = [@tiles.values_at(spot)[0].value.uncolorize.to_i] }
        row_vals
    end

    def cols
        col_vals = {}
        @tiles.keys.each { |spot| col_vals.include?(spot[1]) ? col_vals[spot[1]] << @tiles.values_at(spot)[0].value.uncolorize.to_i : col_vals[spot[1]] = [@tiles.values_at(spot)[0].value.uncolorize.to_i] }
        col_vals
    end

    def blocks
        block_vals = {}
        @tiles.keys.each do |spot| 
            if spot[0] < 5 && spot[1] < 5 
                block_vals.keys.include?(1) ? block_vals[1] << @tiles.values_at(spot)[0].value.uncolorize.to_i : block_vals[1] = [@tiles.values_at(spot)[0].value.uncolorize.to_i]
            elsif spot[0] < 5 && spot[1] > 5 && spot[1] < 9
                block_vals.keys.include?(2) ? block_vals[2] << @tiles.values_at(spot)[0].value.uncolorize.to_i : block_vals[2] = [@tiles.values_at(spot)[0].value.uncolorize.to_i]
            elsif spot[0] < 5 && spot[1] > 9
                block_vals.keys.include?(3) ? block_vals[3] << @tiles.values_at(spot)[0].value.uncolorize.to_i : block_vals[3] = [@tiles.values_at(spot)[0].value.uncolorize.to_i]
            elsif spot[0] > 5 && spot[0] < 9 && spot[1] < 5
                block_vals.keys.include?(4) ? block_vals[4] << @tiles.values_at(spot)[0].value.uncolorize.to_i : block_vals[4] = [@tiles.values_at(spot)[0].value.uncolorize.to_i]
            elsif spot[0] > 5 && spot[0] < 9 && spot[1] > 5 && spot[1] < 9
                block_vals.keys.include?(5) ? block_vals[5] << @tiles.values_at(spot)[0].value.uncolorize.to_i : block_vals[5] = [@tiles.values_at(spot)[0].value.uncolorize.to_i]
            elsif spot[0] > 5 && spot[0] < 9 && spot[1] > 9
                block_vals.keys.include?(6) ? block_vals[6] << @tiles.values_at(spot)[0].value.uncolorize.to_i : block_vals[6] = [@tiles.values_at(spot)[0].value.uncolorize.to_i]
            elsif spot[0] > 9 && spot[1] < 5
                block_vals.keys.include?(7) ? block_vals[7] << @tiles.values_at(spot)[0].value.uncolorize.to_i : block_vals[7] = [@tiles.values_at(spot)[0].value.uncolorize.to_i]
            elsif spot[0] > 9 && spot[1] > 5 && spot[1] < 9
                block_vals.keys.include?(8) ? block_vals[8] << @tiles.values_at(spot)[0].value.uncolorize.to_i : block_vals[8] = [@tiles.values_at(spot)[0].value.uncolorize.to_i]
            elsif spot[0] > 5 && spot[1] < 9
            else  block_vals.keys.include?(9) ? block_vals[9] << @tiles.values_at(spot)[0].value.uncolorize.to_i : block_vals[9] = [@tiles.values_at(spot)[0].value.uncolorize.to_i]
            end
        end
        block_vals
    end

    def check?(hash)
        hash.values.all? { |arr| arr.sort == (1..9).to_a }
    end

    def solved?
        check?(rows) && check?(cols) && check?(blocks) || false
    end

end


# board = Board.new("sudoku1.txt")
# board.render
# board.edit_val([2,2],5)
# board.render

            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/gary_miller_sudoku_project