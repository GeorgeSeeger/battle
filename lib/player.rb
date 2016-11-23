class Player
  attr_reader :name, :health

  def initialize(name)
    @name = name
    @health = 100
    @paralysed = false
  end

  def take_damage
    self.health -= rand(5..15)
  end

  def take_paralysis
    self.paralysed = [false, true].sample
    self.health -= rand(0..10)
  end

  def is_paralysed?
    @paralysed
  end
  private

  attr_writer :health, :paralysed

end
