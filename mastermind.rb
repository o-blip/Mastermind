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
        return
      end

      if i == 11
        puts 'Out of guesses, codemaker wins :<'
        return
      end

      check_guess(guess)

    end
  end
  
  def guess_correct?(guess)
    guess == @computer.code
  end

  def check_guess(guess)
    corr_pos = 0
    (0..3).each do |i|
      if guess[i] == @computer.code[i]
        corr_pos += 1
      end
    end
    corr_color = 4 - @computer.code.difference(guess).length - corr_pos
    puts "#{corr_pos} colors are in the right position"
    puts "#{corr_color} other colors are in the code"
  end



end

class Board
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
    puts 'Enter your guess from these colors:'
    puts 'Red, Green, Blue, Yellow, Orange, Purple'
    guess = []
    loop do
      guess_color = gets.chomp.capitalize
      if !COLORS.include?(guess_color) || guess.include?(guess_color)
        puts 'Invalid color/repeated color'
        next
      end
      guess.push(guess_color)
      return guess if guess.length == 4
    end
  end
  
end

Game.new().play