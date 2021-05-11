class Interface
  include InterfaceText
  include Variables

  def initialize
    system('clear')
    welcome_text

    player_name = user_input
    @game = Game.new(player_name)

    exit_loop greeting(player_name) do |command|
      command == YES ? start : wrong
    end
  end

  def start
    @shuffle = @game.start

    player_turn
  end

  def player_turn
    exit_loop display(@game) do |command|
      case command
      when '1'
        move(@shuffle.next_move)
      when '2'
        move(@shuffle.add_card)
      when '3'
        show_cards
      end
    end
  end

  private

  def move(step)
    @shuffle.dialer_move
    step
  end

  def show_cards
    winner = @shuffle.show_cards
    display_winner(winner)
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

  def user_input
    gets.chomp
  end

  def wrong
    system('clear')
    puts 'Invalid command, press any key for continue'
    user_input
  end
end
