require_relative "player.rb"

class Codemaker < Player
  def initialize
    super
    @code = COLORS.sample(4)
  end
  attr_reader :code
end

class Humanmaker
  def create_code
    puts 'Enter the 4 color code for computer to break (e.g. red blue green yelloe)'
    code = gets.chomp.downcase.split(' ')

    unless code.uniq.length == 4 || COLORS.difference(guess).length == 2
      puts 'Invalid color or repetitions. Guess again.'
      create_code()
    end
    code
  end
end
