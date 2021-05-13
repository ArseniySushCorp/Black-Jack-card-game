module InterfaceText
  include Variables

  def welcome_text
    puts heading
    puts "Welcome, enter you name and let's play"
  end

  def greeting(name)
    [
      "Hello, #{name} wont to start game?",
      "'y' - yes, 'q' - quit"
    ]
  end

  def heading
    '---BLACK JACK THE CARD GAME ON RUBY---'
  end

  def display_game(game)
    display(game, false).concat(actions)
  end

  def display_game_over(winner, game)
    winner == DRAW || winner.nil? ? display_draw(game) : display_winner(winner, game)
  end

  private

  def display(game, show)
    dealer = game.dealer
    player = game.player

    info(dealer, show).concat(info(player, true))
  end

  def display_draw(game)
    display(game, true).concat(draw_text)
  end

  def display_winner(winner, game)
    display(game, true).concat(
      [
        '',
        "#{winner.name} win!",
        'Play again?',
        "'y' - yes, 'q' - quit"
      ]
    )
  end

  def info(person, show)
    [
      '',
      "#{person.name} cards: #{show ? display_cards(person) : hidden_cards(person) }",
      "#{person.name} points: #{show ? person.points : '**'}",
      "#{person.name} bank: #{person.bank}",
      '----------------------------'
    ]
  end

  def show_points(person)
    ["#{person.name} points: #{person.points}"]
  end

  def actions
    [
      '1 - skip',
      '2 - add card',
      '3 - show cards'
    ]
  end

  def draw_text
    [
      "It's a draw!",
      'Play again?',
      "'y' - yes, 'q' - quit"
    ]
  end

  def display_cards(person)
    person.cards.map { |c| c[:value] + c[:suit] }
  end

  def hidden_cards(person)
    '*' * person.cards.size
  end
end
