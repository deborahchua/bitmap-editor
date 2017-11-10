class Bitmap
  def initialize (x, y)
    @x = x
    @y = y
    create_bitmap
  end

  def get(x, y)
    @bitmap[y][x]
  end

  def set(x, y, c)
    @bitmap[y][x] = c
  end

  def clear!
    create_bitmap
  end

  private
  def create_bitmap
    @bitmap = Array.new(@y){Array.new(@x, "O")}
  end
end
