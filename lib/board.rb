class Board
    def initialize
      @board = Array.new(12)
    end
    attr_accessor :board
  
    def print_board(round)
      (0..round).each do |x|
        puts board[x][0].join(' | ') + " | Right position: #{board[x][1][0]}, Right color: #{board[x][1][1]}"
      end
      puts
    end
  end