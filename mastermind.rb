# 12 turns to guess the secret code
# have two players: codebreaker and codemaker
# have one board showing past guesses
# Gameplay loop:
#   1. decide how many games to play (even number)
#   2. decide who's codebreaker/maker and if duplicates and blanks are allowed
#   3. codemaker chooses pattern (6 colors)
#   4. codebreaker tries to guess both order and color   
#   5. codemaker provides feedback with pegs: white peg indicates correct color
#       but wrong position, black indicates a correct color and position  
#   6. feedback/guess loops until all guessed right or until 12 turns

# no duplicates/blanks for now
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


class Player
  COLORS = ['Red', 'Green', 'Blue', 'Yellow', 'Orange', 'Purple']
  def initialize(bot = true)
    @bot = bot
  end
  
end

class Codemaker < Player
  

  def initialize
    super
    @code = COLORS.sample(4)
  end
  attr_reader :code


end

class Codebreaker < Player
  def guess_code
    puts 'Enter your guess from these colors (space separated): Red, Green, Blue, Yellow, Orange, Purple'
    loop do
      guess = gets.chomp.split(' ')
      guess.map!(&:capitalize)
      unless guess.uniq.length == guess.length || COLORS.difference(guess).length == 2
        puts 'Invalid color or repetitions. Guess again.'
        next
      end
      puts
      return guess
    end
  end
  
end

Game.new().play