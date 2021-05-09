module Variables
  INITIAL_BANK = 100

  SPADES = '♠'.freeze
  CLUBS = '♣'.freeze
  HEARTS = '♥'.freeze
  DIAMONDS = '♦'.freeze

  CARD_VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  PICTURE_CARDS = %w[J Q K].freeze
  SUITS = [HEARTS, DIAMONDS, CLUBS, SPADES].freeze
end
