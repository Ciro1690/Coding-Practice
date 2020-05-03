class Board
    attr_reader :size

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def initialize(n)
        @grid = Array.new(n) {Array.new(n,:N)}
        @size = n * n    
    end

    def [](pos)
        row,col = pos
        @grid[row][col]
    end

    def []=(pos,value)
        row,col = pos
        @grid[row][col] = value
    end

    def num_ships
        count = 0
        new_grid = @grid.flatten
        new_grid.each do |ele|
            count +=1 if ele == :S
        end
        count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            true
        else
            self[pos] = :X
            puts "you missed"
            false
        end
    end

    def place_random_ships
        quarter = @size * 0.25
        while self.num_ships < quarter
            rand_row = rand(0...@grid.length)
            rand_col = rand(0...@grid.length)
            pos = [rand_row,rand_col]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S
                   :N
                else
                    ele
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end