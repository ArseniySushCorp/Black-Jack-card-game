class Game
  SPADES = '♠'.freeze
  CLUBS = '♦'.freeze
  HEARTS = '♥'.freeze
  DIAMONDS = '♣'.freeze

  CARD_VALUES = %w[1 2 3 4 5 6 7 8 9 10 J Q K A].freeze
  SUITS = [HEARTS, DIAMONDS, CLUBS, SPADES].freeze

  def initialize
    @deck = CARD_VALUES.map { |card_value| SUITS.map { |suit| { value: card_value, suit: suit } } }.flatten!
    @player = Player.new(gets.chomp)
    @dialer = Dialer.new
  end
end
