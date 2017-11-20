require 'spec_helper'

module BitmapEditor
  module Commands
    RSpec.describe DrawVerticalSegment do
      let(:bitmap) { Bitmap.new(4, 5) }

      def expected_equal_bitmap(bitmap, expected)
        expected.each_with_index do |row, x|
          row.each_with_index do |column, y|
            expect(bitmap.get(x, y)).to eql expected[y][x]
          end
        end
      end

      describe "#draw_vertical_segment" do #X Y1 Y2 C
        it 'fills a vertical segment with a given colour (inclusively between y1 and y2)' do
          command = DrawVerticalSegment.new(bitmap, 2, 1, 3, "B")
          command.perform

          expected = [
            %w(O O O O),
            %w(O O B O),
            %w(O O B O),
            %w(O O B O),
            %w(O O O O),
          ]

          expected_equal_bitmap(bitmap, expected)
        end

        context 'given coordinates are out of bitmap boundaries' do
          it 'does not crash and changes valid coordinates' do
            command = DrawVerticalSegment.new(bitmap, 2, -1, 3, "B")
            command.perform

            expected = [
              %w(O O B O),
              %w(O O B O),
              %w(O O B O),
              %w(O O B O),
              %w(O O O O),
            ]

            expected_equal_bitmap(bitmap, expected)
          end
        end
      end
    end
  end
end
