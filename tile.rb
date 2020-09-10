


class Tile

    attr_reader :given, :value

    def initialize(value, given)
        @value = value
        @given = given
        colors
    end

    def change(val)
        @value = val if @given == false
    end

    def to_s
        @value.to_s
    end
    
end
