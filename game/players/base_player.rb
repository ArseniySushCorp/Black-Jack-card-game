class BasePlayer
  include Scoring

  attr_accessor :cards, :bank
  attr_reader :name

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

  def add_card(card)
    @cards.push(card)
  end

  def cards?(size)
    @cards.size == size
  end

  def fold_cards
    @cards = []
  end

  def lost?
    points > 21
  end

  def not_lost?
    points <= 21
  end

  def display_cards
    @cards.map { |c| c[:value] + c[:suit] }
  end

  def hidden_cards
    '*' * @cards.size
  end
end
