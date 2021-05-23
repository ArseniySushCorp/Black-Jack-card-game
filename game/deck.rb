class Deck
  include Variables

  def create
    @cards = CARD_VALUES.map do |card_value|
      SUITS.map { |suit| { value: card_value, suit: suit } }
    end.flatten!.shuffle
  end

  def shift(value = 1)
    return @cards.shift if value == 1

    @cards.shift(value)
  end
end
