class Player
  include Scoring

  attr_reader :cards

  def initialize(name, cards, bank)
    @cards = cards
    @name = name
    @bank = bank
    @points = count_points(cards)
  end
end
