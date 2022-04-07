require_relative "player.rb"

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