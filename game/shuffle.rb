class Shuffle
  attr_reader :winner

  def initialize(game)
    @game = game
    @who_move = nil

    start
  end

  def start
    @game.destribution
    @who_move = @game.player
  end

  def next_move
    next_player = @game.players.find { |p| p != @who_move }

    @who_move = next_player
  end

  def add_card
    @game.add_card(@who_move)

    next_move
  end

  def show_cards
    @game.define_winner.isNil? ? 'DRAW' : @game.define_winner
  end
end
