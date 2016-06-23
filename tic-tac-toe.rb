class Game
    attr_accessor :player1, :player2
    def initialize
        @grid = Board.new
        @turn = 1
    end
    def play
        get_names
        turn
        has_won
    end
    def get_names
        print  "Enter player1(X)'s name: "
        self.player1 = gets.chomp
        puts
        print "Enter player2(O)'s name: "
        self.player2 = gets.chomp
    end
    def turn
        if @turn == 1
            print "#{self.player1}'s turn, type in a position (0-8): "
            pos = gets.to_i
            place(1,pos)
            @turn += 1
        else
            print "#{self.player2}'s turn, type in a position (0-8): "
            pos = gets.to_i
            place(2,pos)
            @turn -= 1
        end
    end
    
    def place (player,pos)
        @grid.place(player,pos)
    end
    def has_won
        while @grid.won == false
            turn
        end
        puts
        puts "END OF GAME"
    end
end


class Board
    attr_accessor :won
    def initialize
        @board = Array.new(9,nil)
        self.won = false
    end
    def place (player,pos)
        @board[pos] = "X" if player == 1
        @board[pos] = "O" if player == 2
        show_board
        check_wins
    end
    def show_board
        print @board[0,3]
        puts
        print @board[3,3]
        puts
        print @board[6,3]
        puts
    end
    def check_wins
        check_rows
        check_columns
        check_diagonals
    end
    def check_rows
        row_num = 0
        3.times do
            row = @board[row_num,3]
            if row.all? {|i| i == row[0] && i != nil}
                self.won = true
            else
                row_num += 3
            end
        end
    end
    def check_columns
        col_num = 0
        3.times do
            col = [@board[0+col_num],@board[3+col_num],@board[6+col_num]]
            if col.all? {|i| i == col[0] && i != nil}
                self.won = true
            else
                col_num += 1
            end
        end
    end
    def check_diagonals
        right_diag = [@board[0],@board[4],@board[8]]
        left_diag = [@board[2],@board[4],@board[6]]
        if left_diag.all? {|i| i == left_diag[0] && i != nil}
            self.won = true
        elsif right_diag.all? {|i| i == right_diag[0] && i != nil}
            self.won = true
        end
    end
end

a = Game.new
a.play