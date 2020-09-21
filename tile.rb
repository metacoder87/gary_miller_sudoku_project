            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/gary_miller_sudoku_project


class Tile

    attr_reader :given, :value

    def initialize(value, given)
        @value = value
        @given = given
    end

    def change(val)
        @value = val if @given == false
    end

    def to_s
        @value.to_s
    end
    
end


            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/gary_miller_sudoku_project