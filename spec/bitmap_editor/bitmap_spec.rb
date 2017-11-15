require 'spec_helper'

module BitmapEditor
  RSpec.describe Bitmap do
    let(:bitmap) { Bitmap.new(3, 4) }

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



    describe '#draw_vertical_segment' do #X Y1 Y2 C
      let(:bitmap) { Bitmap.new(4, 5) }
      it 'fills a vertical segment with a given colour (inclusively between y1 and y2)' do
        bitmap.draw_vertical_segment(2, 1, 3, "B")
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
