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
require_relative "lib/game.rb"

Game.new().play