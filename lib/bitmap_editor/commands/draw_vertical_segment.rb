module BitmapEditor
  module Commands
    class DrawVerticalSegment
      def initialize(bitmap, x, y1, y2, c)
        @bitmap = bitmap
        @x = x
        @y1 = y1
        @y2 = y2
        @c = c
      end

      def perform
        (y1..y2).each do | y |
          bitmap.set(x, y, c)
        end
      end

      private
      attr_reader :bitmap, :x, :y1, :y2, :c
    end
  end
end
