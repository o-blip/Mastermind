require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game
  def initialize
    @mode = choose_role()
    @human = Human.new
    @computer = Computer.new
    @board = Board.new
    @code = nil
  end

  def play
    if @mode
      round_human
    else
      round_pc
    end
    play_again
  end

  def choose_role
    puts 'Do you want to be the codebreaker? (y/n)'
    gets.chomp.downcase == 'y'
  end

  def round_pc
    @code = @human.create_code
    guess = @computer.guess_code
    (0..11).each do |round|
      if correct?(guess)
        @board.print_board
        return
      end
      check(guess, round)
      break if round == 11

      guess = @computer.guess_code
    end
    @board.print_board(11)
    puts "Code was #{@code}"
    puts 'Codemaker wins :<'
  end

  def round_human
    @code = @computer.create_code
    guess = @human.guess_code
    (0..10).each do |round|
      return if correct?(guess)

      check(guess, round)
      @board.print_board(round)
      guess = @human.guess_code
    end
    puts "Code was #{@code}"
    puts 'Codemaker wins :<'
  end

  def correct?(guess)
    puts 'You win!' if guess == @code
    guess == @code
  end

  def check(guess, round)
    corr_pos = 0
    (0..3).each { |i| corr_pos += 1 if guess[i] == @code[i] }
    corr_color = 4 - @code.difference(guess).length - corr_pos
    results = [corr_pos, corr_color]
    @board.board[round] = [guess, results]
  end

  def play_again
    puts 'Want to play again? (y/n)'
    Game.new.play if gets.chomp.downcase == 'y'
  end
end
