class Hand
  include Variables

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

  private

  def count_points(cards)
    count = without_ace(cards) || 0

    include_ace?(cards) ? count_ace(cards, count) : count
  end

  def without_ace(cards)
    is_picture = ->(x) { PICTURE_CARDS.include? x }

    cards.reduce(0) do |points, card|
      case card[:value]

      when '1'..'10'  then points + card[:value].to_i
      when is_picture then points + 10
      else points
      end
    end
  end

  def count_ace(cards, count)
    cards.reduce(count) do |points, card|
      if card.value? 'A'
        biggest = points + 11

        points += biggest > 21 ? 1 : 11
      else
        points
      end
    end
  end

  def include_ace?(cards)
    cards.any? { |card| card.value? 'A' }
  end
end
