class Game
  include Variables

  attr_reader :player

  def initialize(player_name)
    @deck = create_deck
    @player = Player.new(player_name, @deck.shift(2), INITIAL_BANK)
    @dialer = Dialer.new(@deck.shift(2), INITIAL_BANK)
  end

  private

  def create_deck
    CARD_VALUES.map { |card_value| SUITS.map { |suit| { value: card_value, suit: suit } } }.flatten!.shuffle
  end
end
