class Human
  COLORS = ['Red', 'Green', 'Blue', 'Yellow', 'Orange', 'Purple']

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

