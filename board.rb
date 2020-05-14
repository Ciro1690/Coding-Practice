class Board
    def initialize
        row,col,default_value = 3,3,'_'
        @grid = Array.new(row){Array.new(col,default_value)}
    end

    def [](position)
        row,col = position
        @grid[row][col]
    end

    def []=(position,val)
        row,col = position
        @grid[row][col] = val
    end

    def valid?(position)
        row,col = position
        position.all? do |i|
            i >=0 && i < @grid.length
        end
    end

    def empty?(position)
        self[position] == '_'
    end

    def place_mark(position,mark)
        if !valid?(position) || !empty?(position)
            raise "invalid position"
        else
            self[position] = mark
        end
    end

    def print
        @grid.each do |row|
            puts row.join(' ')
        end
    end

    def win_row?(mark)
        @grid.any? {|row| row.all?(mark)}
    end

    def win_col?(mark)
        @grid.transpose.any? {|col| col.all?(mark)}
    end

    def win_diagonal?(mark)
        if (@grid[0][0] == mark) && (@grid[1][1] == mark) && (@grid[2][2] == mark)
            return true
        elsif (@grid[2][0] == mark) && (@grid[1][1] == mark) && (@grid[0][2] == mark)
            return true
        else
            return false
        end
    end

    def win?(mark)
       win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        indices = (0...@grid.length).to_a
        positions = indices.product(indices)
        positions.any?{|position|empty?(position)}
    end
end