require 'spec_helper'

module BitmapEditor
  module Commands
    RSpec.describe DrawVerticalSegment do
      let(:bitmap) { Bitmap.new(4,5) }

      describe "#draw_vertical_segment" do #X Y1 Y2 C
        it 'fills a vertical segment with a given colour (inclusively between y1 and y2)' do
          command = DrawVerticalSegment.new(bitmap, 2, 1, 3, "B")
          command.perform
          #  y
          #  O O O O
          #  O O B O
          #  O O B O
          #  O O B O
          #  O O O O x

          expect(bitmap.get(2, 1)).to eql "B"
          expect(bitmap.get(2, 2)).to eql "B"
          expect(bitmap.get(2, 3)).to eql "B"

          expect(bitmap.get(2, 0)).to eql "O"
          expect(bitmap.get(2, 4)).to eql "O"
        end

      end
    end
  end
end
