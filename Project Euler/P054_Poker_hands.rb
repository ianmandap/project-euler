# Problem Statement
# In the card game poker, a hand consists of five cards and are ranked, 
# from lowest to highest, in the following way:

#     High Card:        Highest value card.
#     One Pair:         Two cards of the same value.
#     Two Pairs:        Two different pairs.
#     Three of a Kind:  Three cards of the same value.
#     Straight:         All cards are consecutive values.
#     Flush:            All cards of the same suit.
#     Full House:       Three of a kind and a pair.
#     Four of a Kind:   Four cards of the same value.
#     Straight Flush:   All cards are consecutive values of same suit.
#     Royal Flush:      Ten, Jack, Queen, King, Ace, in same suit.

# The cards are valued in the order:
# 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

# If two players have the same ranked hands then the rank made up of the highest value wins; 
# for example, a pair of eights beats a pair of fives (see example 1 below). 
# But if two ranks tie, for example, both players have a pair of queens, 
# then highest cards in each hand are compared (see example 4 below); 
# if the highest cards tie then the next highest cards are compared, and so on.


# Consider the following five hands dealt to two players:
# Hand	 	Player 1	 	   Player 2	 	        Winner
# 1	 	5H 5C 6S 7S KD    2C 3S 8S 8D TD      Player 2
#     Pair of Fives     Pair of Eights
# 2	 	5D 8C 9S JS AC    2C 5C 7D 8S QH      Player 1
#     Highest card Ace  Highest card Queen
# 3	 	2D 9C AS AH AC    3D 6D 7D TD QD      Player 2
#     Three Aces        Flush with Diamonds
# 4	 	4D 6S 9H QH QC    3D 6D 7H QD QS      Player 1
#     Pair of Queens    Pair of Queens
#     Highest card Nine Highest card Seven  Player 1
# 5	 	2H 2D 4C 4D 4S    3C 3D 3S 9S 9D
#     Full House        Full House
#     With Three Fours  with Three Threes

# The file, poker.txt, contains one-thousand random hands dealt to two players.
# Each line of the file contains ten cards (separated by a single space):
# the first five are Player 1's cards and the last five are Player 2's cards.
# You can assume that all hands are valid (no invalid characters or repeated cards),
# each player's hand is in no specific order, and in each hand there is a clear winner.

# How many hands does Player 1 win?
def all_same_suite?(arr)
  arr.uniq!.length == 1
end

def consecutive?(arr)
  arr.sort!
  arr.each_with_index do |n, idx|
    break if n == arr[-1]
    return false unless n + 1 == arr[idx + 1]
  end
  true
end

def transform_face_cards(str)
  # Transform J, Q, K, A to 11, 12, 13, 14
end

def values_and_suites(array)
  values = []
  suites = []
  array.each do |card|
    values << card[0...-1]
    suites << card[-1]
  end
  [values, suites]
end

def check_winner(hand1, hand2)
  # Return 1 for hand1 win, 2 for hand2 win
  # Draws not implemented
  values_and_suites(hand1)
end

# p check_winner(["QC", "KC", "3S", "JC", "KD"], ["2C", "8D", "AH", "QS", "TS"])

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  file_name  = '~/AvionSchool/ruby_portfolio/Project Euler/assets/p054_poker.txt'
  file = File.open(File.expand_path(file_name))

  # Transform Data into Array
  file_content = file.readlines(chomp: true)
  file.close

  # Initialize
  p1_wins = 0
  p2_wins = 0

  # Iterate through each match and check winner
  file_content.each do |arr|
    p1_hand = arr.split(' ')[0..4]
    p2_hand = arr.split(' ')[-5..]
    if check_winner(p1_hand, p2_hand) == 1
      p1_wins += 1
    else
      p2_wins += 1
    end
  end

  p p1_wins

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

# main
