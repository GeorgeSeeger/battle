class Player
  attr_reader :name
  attr_accessor :health

  def initialize(name)
    @name = name
    @health = 100
  end

  def attack(player)
    player.health -= 10
  end
end
