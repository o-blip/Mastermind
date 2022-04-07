require_relative "board.rb"
require_relative "codemaster.rb"
require_relative "codemaker.rb"

class Game
    def initialize()
      @human = Codebreaker.new()
      @computer = Codemaker.new()
      @board = Board.new()
    end
  
    def play
      (0..11).each do |i|
        guess = @human.guess_code
  
  
        if guess_correct?(guess)
          puts 'You won dude!!!'
          break
        end
  
        if i == 11
          puts 'Out of guesses, codemaker wins :<'
          break
        end
  
        results = check_guess(guess)
        @board.board[i] = [guess, results]
        @board.print_board(i)
      end
    end
    
    def guess_correct?(guess)
      guess == @computer.code
    end
    
    def check_guess(guess)
      corr_pos = 0
      (0..3).each do |i|
        corr_pos += 1 if guess[i] == @computer.code[i]
      end
      corr_color = 4 - @computer.code.difference(guess).length - corr_pos
      [corr_pos, corr_color]
    end
  end