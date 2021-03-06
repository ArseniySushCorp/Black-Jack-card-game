class Shuffle
  attr_reader :winner

  def initialize(game)
    @game = game
    @dealer = @game.dealer
    @player = @game.player
    @who_move = nil

    start
  end

  def start
    @winner = nil
    @game.place_bet
    @game.destribution
    @who_move = @player
  end

  def next_move
    check_cards

    @who_move = next_player

    dealer_move if @who_move == @dealer
  end

  def next_player
    @game.players.find { |p| p != @who_move }
  end

  def dealer_move
    case @dealer.points
    when 17..40 then next_move
    when 1..16 then add_card
    end
  end

  def add_card
    @game.add_card(@who_move)

    next_move
  end

  def check_cards
    show_cards if @player.hand.cards?(3) && @dealer.hand.cards?(3)
  end

  def show_cards
    @winner = @game.define_winner
  end
end
