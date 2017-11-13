require './bitmap'

module DrawSegment

  attr_reader :x1, :x2, :y, :c
  def initialize(x1, x2, y, c)
    @x1 = x1
    @x2 = x2
    @y = y
    @c = c
  end

  def draw_horizontal_segment(x1, x2, y, c)
    (x1..x2).each do | x |
      set(x, y, c)
    end
end
