class Hand
  include Scoring

  attr_accessor :cards

  def initialize
    @cards = []
  end

  def points
    count_points(@cards)
  end

  def add_card(card)
    @cards.push(card)
  end

  def cards?(size)
    @cards.size == size
  end

  def fold_cards
    @cards = []
  end
end
