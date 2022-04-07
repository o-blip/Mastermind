require_relative "board.rb"
require_relative "codebreaker.rb"
require_relative "codemaker.rb"

class Game
  def initialize
    @human = nil
    @computer = nil
    @board = Board.new
  end

  def play
    ans =choose_role()
    if ans == 'y'
      # player is codebreaker

    else
      # player is codemaker
      code = @human.create_code
      (0..11).each do |i|
        p @board.past_guesses
        guess = @computer.guess_code(@board.past_guesses)
        @board.past_guesses.push(guess)
        if guess_correct?(guess, code)
          puts 'You won dude!!!'
          break
        end

        if i == 11
          puts 'Out of guesses, codemaker wins :<'
          break
        end

        results = check_guess(guess,code)
        @board.board[i] = [guess, results]
        @board.print_board(i)
      end
    # (0..11).each do |i|
    #   guess = @human.guess_code
    #   if guess_correct?(guess)
    #     puts 'You won dude!!!'
    #     break
    #   end

    #   if i == 11
    #     puts 'Out of guesses, codemaker wins :<'
    #     break
    #   end

    #   results = check_guess(guess)
    #   @board.board[i] = [guess, results]
    #   @board.print_board(i)
    end
  end

  def guess_correct?(guess,code)
    guess == code
  end

  def check_guess(guess,code)
    corr_pos = 0
    (0..3).each do |i|
      corr_pos += 1 if guess[i] == code[i]
    end
    corr_color = 4 - code.difference(guess).length - corr_pos
    [corr_pos, corr_color]
  end

  def choose_role
    puts 'Do you want to be the codebreaker? (y/n)'
    case gets.chomp.downcase
    when 'y'
      @human = Codebreaker.new
      @computer = Codemaker.new
      'y'
    else
      @human = Humanmaker.new
      @computer = Botbreaker.new
      'n'
    end
  end
end
