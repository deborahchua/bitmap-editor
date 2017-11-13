class Bitmap
  include BitmapEditor

  attr_reader :width, :height, :bitmap

  def initialize(x, y)
    @width = x
    @height = y
    create_bitmap
  end

  def get(x, y)
    bitmap[y][x]
  end

  def set(x, y, c)
    bitmap[y][x] = c
  end

  def clear!
    create_bitmap
  end

  private

  def create_bitmap
    @bitmap = Array.new(height){Array.new(width, "O")}
  end
end
