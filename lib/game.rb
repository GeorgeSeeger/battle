class Game

  attr_reader :player1, :player2

  def initialize(player1,player2)
    @players = player2, player1
    @player2, @player1 = players
  end

  def attack
    player_defense.take_damage unless player_attack.is_paralysed?
  end

  def paralyse
    player_defense.take_paralysis unless player_attack.is_paralysed?
  end

  def player_attack
    players.first
  end

  def player_defense
    players.last
  end

  def turn_switch
    player_attack.unparalyse
    players.reverse!
  end

  def self.create(player1, player2)
    @me = Game.new(player1, player2)
  end

  def self.instance
    @me
  end

  private
  attr_reader :players

end
