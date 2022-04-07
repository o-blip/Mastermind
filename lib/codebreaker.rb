require_relative "player.rb"
require_relative 'board'

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

class Botbreaker < Player
  def guess_code(past_guesses)
    guess = COLORS.sample(4)
    guess.map!(&:downcase)
    guess_code if past_guesses.any?(guess)
    guess
  end
end
