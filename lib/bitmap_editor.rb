module BitmapEditor
  def draw_horizontal_segment(x1, x2, y, c)
    (x1..x2).each do | x |
      set(x, y, c)
    end
  end

  def draw_vertical_segment(x, y1, y2, c)
    (y1..y2).each do | y |
      set(x, y, c)
    end
  end
end
