class Board
    def initialize (perfsqr)
        @GRID = perfsqr
        @SQRGRID = (@GRID**0.5).to_i
        @board = Array.new(@GRID,nil)
        self.display
    end
    def place (m,element)
        puts
        @board[element] = m
        self.display
    end
    def display
        i = 0
        @SQRGRID.times do
            puts
            print @board[i,@SQRGRID]
            i += @SQRGRID
            puts
        end
        self.check
    end
    def check
        i = 0
        colnum = 1
        check_columns = @board.select {|elem| @board.index(elem)%@SQRGRID == 0}
        print check_columns
        @SQRGRID.times do
            check_rows = @board[i,@SQRGRID]
            if check_rows.all? {|item| item == check_rows[0] && item != nil}
                puts
                puts "END OF GAME"
                puts "#{check_rows[0]} WINS"
                break
            elsif check_columns.all? {|item| item == check_columns[0] && item != nil && check_columns.count == @SQRGRID}
                puts
                puts "END OF GAME"
                puts "#{check_columns[0]} WINS"
                break
            else
                i += @SQRGRID
            end
        end
    end
end

a = Board.new(9)
a.place(1,0)
a.place(1,3)
a.place(1,6)