




require "colorize"
require_relative "tile"

class Board


    def self.from_file
        IO.readlines(@puzzle).each { |line| @grid << line.chomp.split("") }
    end

    attr_accessor :puzzle, :grid, :tiles

    def initialize(puzzle)
        @puzzle = "puzzles/" + puzzle
        @grid = []
        self.from_file
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

    def solved?

    end

end


board = Board.new("sudoku1.txt")
board.render
board.edit_val([2,2],5)
board.render