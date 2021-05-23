class BasePlayer
  include Variables

  attr_accessor :bank
  attr_reader :name, :hand

  def initialize(bank, name)
    @hand = Hand.new
    @name = name
    @bank = bank
  end

  def points
    @hand.points
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
end
