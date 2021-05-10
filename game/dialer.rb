class Dialer < BasePlayer
  include Scoring
  attr_accessor :bank

  def initialize(bank, name = 'Dialer')
    super
  end
end
