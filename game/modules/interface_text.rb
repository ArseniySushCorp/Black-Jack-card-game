module InterfaceText
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

  def display(game)
    player = game.player
    dialer = game.dialer
    hidden_cards = '*' * dialer.cards.size

    [
      '',
      "Dialer cards: #{hidden_cards}",
      '',
      '----------------------------',
      "Your cards: #{player.display_cards}",
      "Your points: #{player.points}",
      '----------------------------',
      '1 - skip',
      '2 - add card',
      '3 - show cards'
    ]
  end
end
