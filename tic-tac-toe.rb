class Board
    def initialize (perfsqr)
        @SQRGRID = (perfsqr**0.5).to_i
        @board = Array.new(@SQRGRID) {|i| Array.new(@SQRGRID,nil)}
        self.display
    end
    def place (m,index,element)
        puts
        @board[index][element] = m
        self.display
    end
    def display
        i = 0
        @SQRGRID.times do
            puts
            print @board[i]
            i += 1
            puts
        end
        self.check
    end
    def check
        i = 0
        x = 0
        column_index = 0
        @SQRGRID.times do
            check_rows = @board[i]
            check_columns = []
            right_diagonal = (0...@SQRGRID).collect {|i| @board[i][i]}
            @SQRGRID.times do
                check_columns.unshift(@board[x][column_index])
                x += 1
            end
            if check_rows.all? {|item| item == check_rows[0] && item != nil}
                puts
                puts "END OF GAME"
                puts "#{check_rows[0]} WINS"
                break
            elsif check_columns.all? {|item| item == check_columns[0] && item != nil}
                puts
                puts "END OF GAME"
                puts "#{check_columns[0]} WINS"
                break
            elsif right_diagonal.all? {|item| item == right_diagonal[0] && item != nil}
                puts
                puts "END OF GAME"
                puts "#{right_diagonal[0]} WINS"
                break
            else
                i += 1
                x = 0
                column_index += 1
            end
        end
    end
end

a = Board.new(9)
a.place(1,0,0)
a.place(1,1,1)
a.place(1,2,2)