require_relative "player.rb"

class Codemaker < Player
    def initialize
      super
      @code = COLORS.sample(4)
    end
    attr_reader :code
  end