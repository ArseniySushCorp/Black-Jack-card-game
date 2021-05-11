class Shuffle
  attr_reader :winner

  def initialize(game)
    @game = game
    @dialer = @game.dialer
    @player = @game.player
    @who_move = nil

    start
  end

  def start
    @game.destribution
    @who_move = @game.player
  end

  def next_move
    check_cards

    next_player = @game.players.find { |p| p != @who_move }

    @who_move = next_player

    dialer_move if next_player == @dialer
  end

  def dialer_move
    case @dialer.points
    when 17..30 then next_move
    when 1..16 then add_card
    end

    next_move
  end

  def add_card
    @game.add_card(@who_move)

    next_move
  end

  def check_cards
    show_cards if @player.cards?(3) && @dialer.cards?(3)
  end

  def show_cards
    @game.define_winner
  end
end
