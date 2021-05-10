class Shuffle
  def initialize(game)
    @game = game
    
    start
  end

  def start
    until someone_lost? do
      game.make_move
    end
  end

  def someone_lost?

  end
end
