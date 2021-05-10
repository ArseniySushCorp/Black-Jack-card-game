# Пользователь видит сумму своих очков. Сумма считается так: от 2 до 10 - по номиналу карты,
# все «картинки» - по 10, туз - 1 или 11, в зависимости от того, какое значение будет ближе
# к 21 и что не ведет к проигрышу (сумме более 21).
module Scoring
  include Variables

  def count_points(cards)
    count = without_ace(cards) || 0

    include_ace?(cards) ? count_ace(cards, count) : count
  end

  private

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
