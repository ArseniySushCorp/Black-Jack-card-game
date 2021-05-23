class Interface
  include InterfaceText
  include Variables

  def initialize
    system('clear')
    welcome_text

    player_name = user_input
    @game = Game.new(player_name)

    show greeting(player_name)

    command = user_input

    command == YES ? start : wrong
  end

  def start
    @game.clear
    @shuffle = @game.start

    player_actions
  end

  def player_actions
    show(display_game(@game))
    command = user_input

    case command
    when '1' then switch(@shuffle.next_move)
    when '2' then switch(@shuffle.add_card)
    when '3' then show_cards
    else wrong
    end
  end

  private

  def switch(action)
    if @shuffle.winner
      game_over(@shuffle.winner)
    else
      player_actions
      action
    end
  end

  def show_cards
    game_over(@shuffle.show_cards)
  end

  def game_over(winner)
    exit_loop display_game_over(winner, @game) do |command|
      command == YES ? start : wrong
    end
  end

  def exit_loop(texts, &block)
    catch(:exit) do
      loop do
        system('clear')
        puts heading
        texts.each { |text| puts text }
        command = user_input
        throw :exit if command == QUIT
        block.call(command)
      end
    end
  end

  def show(value)
    system('clear')
    puts heading
    value.each { |text| puts text }
  end

  def user_input
    gets.chomp
  end

  def wrong
    system('clear')
    puts 'Invalid command, press any key for continue'
    user_input
  end
end
