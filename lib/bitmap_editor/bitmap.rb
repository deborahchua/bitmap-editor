module BitmapEditor
  class Bitmap
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

    def to_s
      bitmap.map { |row| row.join(" ") }.join("\n")
    end

    def show_bitmap
      (0..height - 1).each do | y |
        (0..width).each do | x |
            @value = get(x, y)
          if x == 0
            print "\n#{@value}"
          else
            print "#{@value}"
          end
        end
      end
    end

    def draw_vertical_segment(x, y1, y2, c)
      (y1..y2).each do | y |
        set(x, y, c)
      end
    end

    private

    def create_bitmap
      @bitmap = Array.new(height) do
        Array.new(width) { "O" }
      end
    end
  end
end
