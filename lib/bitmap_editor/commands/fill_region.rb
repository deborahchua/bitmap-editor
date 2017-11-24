module BitmapEditor
  module Commands
    class FillRegion
      def initialize(bitmap, x, y, c)
        @bitmap = bitmap
        @x = x
        @y = y
        @c = c
        @current_colour = bitmap.get(x, y)
      end

      def perform
        puts "Original bitmap:"
        puts bitmap
        coordinates(x, y)
        puts "Updated bitmap:"
        puts bitmap
      end

      def coordinates(x, y)
        # puts "checking #{position} coordinate (#{x},#{y})"
        return if x < 0 || x > bitmap.width
        return if y < 0 || y == bitmap.height
        return if bitmap.get(x, y) != current_colour

        # puts "Fill (#{x},#{y}) with '#{c}'"

        bitmap.set(x, y, c)

        # puts bitmap

        coordinates(x, y - 1)      #north
        coordinates(x + 1, y - 1)  #northeast
        coordinates(x + 1, y)      #east
        coordinates(x + 1, y + 1)  #southeast
        coordinates(x, y + 1,)     #south
        coordinates(x - 1, y + 1)  #southwest
        coordinates(x - 1, y)      #west
        coordinates(x - 1, y - 1,) #northwest

      end


      private
        attr_reader :bitmap, :x, :y, :c, :current_colour

    end
  end
end
