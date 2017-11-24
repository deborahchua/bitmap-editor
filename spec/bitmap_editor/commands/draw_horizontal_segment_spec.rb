require 'spec_helper'

module BitmapEditor
  module Commands
    RSpec.describe DrawHorizontalSegment do
      let(:bitmap) { Bitmap.new(4, 5) }

      def expected_equal_bitmap(bitmap, expected)
        expected.each_with_index do |row, x|
          row.each_with_index do |column, y|
            expect(bitmap.get(x, y)).to eql expected[y][x]
          end
        end
      end

      describe '#draw_horizontal_segment' do #X1 X2 Y C
        it 'fills a horizontal segment with a given colour (inclusively between x1 and x2)' do
          command = DrawHorizontalSegment.new(bitmap, 1, 3, 2, "A")
          command.perform
          
          expected = [
            %w(O O O O),
            %w(O O O O),
            %w(O A A A),
            %w(O O O O),
            %w(O O O O),
          ]

          expected_equal_bitmap(bitmap, expected)
        end
      end

    end
  end
end
