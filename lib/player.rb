class Player
  DEFAULT_POINTS = 20

  attr_reader :name, :points

  def initialize(name, init_points = DEFAULT_POINTS)
    @name = name
    @points = init_points
  end

  def receive_damage
    @points -= 10
  end

end
