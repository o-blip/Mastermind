class Computer
  COLORS = ['Red', 'Green', 'Blue', 'Yellow', 'Orange', 'Purple']
  def initialize
    @past_guesses = []
  end
  def guess_code
    guess = COLORS.sample(4)
    guess.map!(&:downcase)
    guess_code if @past_guesses.any?(guess)
    @past_guesses.push(guess)
    guess
  end
  
  def create_code
    code = COLORS.sample(4)
  end
end
