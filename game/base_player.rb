class BasePlayer
  include Scoring

  attr_accessor :cards, :bank

  def initialize(bank, name)
    @name = name
    @bank = bank
  end

  def points
    count_points(@cards)
  end

  def place_bet
    @bank -= RATE

    raise 'Bank empty' if @bank.zero?
  end

  def lost?
    points > 21
  end

  def not_lost?
    points <= 21
  end

  def add_card(card)
    @cards.push(card)
  end

  def two_cards?
    @cards.size == 2
  end
end
