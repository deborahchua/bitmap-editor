module BitmapEditor

  def draw_horizontal_segment(x1, x2, y, c)
    (x1..x2).each do | x |
      set(x, y, c)
    end
end
