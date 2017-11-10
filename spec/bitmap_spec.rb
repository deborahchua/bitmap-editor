require 'spec_helper'
require './lib/bitmap_editor/bitmap'

module BitmapEditor
  RSpec.describe Bitmap do
    let(:bitmap) { Bitmap.new(4, 5) }

    describe '#get' do
      it 'should return the colour of a given coordinate' do
        expect(bitmap.get(2, 2)).to eql 'O'
      end
    end

    describe '#set' do
      it 'should set a coordinate with a given colour' do
        bitmap.set(1, 1, 'A')
        bitmap.set(1, 2, 'B')

        expect(bitmap.get(1, 1)).to eql 'A'
        expect(bitmap.get(1, 2)).to eql 'B'
      end
    end

    describe '#clear!' do
      it 'resets the bitmap to have default colour' do
        bitmap.set(1, 2, 'B')

        expect(bitmap.get(1, 2)).to eql 'B'
        bitmap.clear!

        expect(bitmap.get(1, 2)).to eql 'O'
      end
    end

    describe '#draw_horizontal_segment' do #X1 X2 Y C
      it 'fills a horizontal segment with a given colour (inclusively between x1 and x2)' do
        bitmap.draw_horizontal_segment(1, 3, 2, "A")
        #  O O O O
        #  O O O O
        #  O A A A
        #  O O O O

        expect(bitmap.get(1, 2)).to eql "A"
        expect(bitmap.get(2, 2)).to eql "A"
        expect(bitmap.get(3, 2)).to eql "A"

        expect(bitmap.get(0, 2)).to eql "O"
      end
    end

    describe '#draw_vertical_segment' do #X Y1 Y2 C
      it 'fills a horizontal segment with a given colour (inclusively between x1 and x2)' do
        bitmap.draw_horizontal_segment(1, 3, 2, "A")
        #  O O O O
        #  O O O O
        #  O A A A
        #  O O O O

        expect(bitmap.get(1, 2)).to eql "A"
        expect(bitmap.get(2, 2)).to eql "A"
        expect(bitmap.get(3, 2)).to eql "A"

        expect(bitmap.get(0, 2)).to eql "O"
      end
    end
  end
end
