# Create a standard 52 card deck
# Sort card suits according to Hearts, Diamonds, Clubs, then Spades.
# Sort cards in ascending order, from 2 to Ace.

def create_deck
  # Your code goes here
    cards = []
    %w(h d c s).each do |suit|
        %w(2 3 4 5 6 7 8 9 10 J Q K A).each do |num|
            cards.push("#{num}#{suit}")
        end
    end
    return cards
end


card_deck = create_deck

puts card_deck[0] == "2h"   # 2 of Hearts
puts card_deck[8] == "10h"  # 10 of Hearts
puts card_deck[51] == "As"  # Ace of Spades
