class Board
  def initialize
    @board = Array.new(12)
  end
  attr_accessor :board, :past_guesses

  def print_board(round)
    (0..round).each do |x|
      guesses = board[x][0]
      right_colors = board[x][1][1]
      right_pos = board[x][1][0]
      puts <<~HEREDOC
        #{x + 1}. #{guesses[0]}  #{guesses[1]}  #{guesses[2]}  #{guesses[3]}  | Color: #{right_colors} Position: #{right_pos}
      HEREDOC
    end
    puts
  end
end
