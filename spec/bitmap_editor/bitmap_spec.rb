require 'spec_helper'
require 'pry'

module BitmapEditor
  RSpec.describe Bitmap do
    let(:bitmap) { Bitmap.new(3, 4) }

    def expected_equal_bitmap(bitmap, expected)
      expected.each_with_index do |row, x|
        row.each_with_index do |column, y|
          expect(bitmap.get(x, y)).to eql expected[y][x]
        end
      end
    end

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

    describe '#show_bitmap' do
      it 'should output the current bitmap' do
        expected_output = "\nOOO\nOOO\nOOO\nOOO"

        expect { bitmap.show_bitmap }.to output(expected_output).to_stdout

      end
    end

    describe '#clear!' do
      it 'resets the bitmap to have default colour' do
        bitmap.set(1, 2, 'B')

        expect(bitmap.get(1, 2)).to eql 'B'
        bitmap.clear!

        expected = [
          %w(O O O),
          %w(O O O),
          %w(O O O),
          %w(O O O),
        ]

        expected_equal_bitmap(bitmap, expected)
      end
    end
  end
end
