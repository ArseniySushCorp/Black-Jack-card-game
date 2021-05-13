class Game
  include Variables

  attr_reader :player, :dealer, :players

  def initialize(player_name)
    @game_bank = 0
    @deck = Deck.new
    @player = Player.new(INITIAL_BANK, player_name)
    @dealer = Dealer.new(INITIAL_BANK)
    @players = [@player, @dealer]
  end

  def start
    Shuffle.new(self)
  end

  def destribution
    @deck.create

    @players.each { |p| p.hand.cards = @deck.shift(2) }
  end

  def add_card(person)
    person.hand.add_card(@deck.shift) if person.hand.cards?(2)
  end

  def place_bet
    @players.each(&:place_bet)

    @game_bank = RATE * @players.size
  end

  def define_winner
    return draw if @player.points == @dealer.points || all_lost

    return win find_winner if someone_lost?

    if @player.points > @dealer.points
      win @player
    else
      win @dealer
    end
  end

  def clear
    @players.each { |p| p.hand.fold_cards }
    @deck.create

    @game_bank = 0
  end

  private

  def find_winner
    @players.find(&:not_lost?)
  end

  def all_lost
    find_winner.nil?
  end

  def someone_lost?
    @players.any?(&:lost?)
  end

  def draw
    @players.each { |p| p.bank += @game_bank / @players.size }
    DRAW
  end

  def win(player)
    player.bank += @game_bank
    player
  end
end
