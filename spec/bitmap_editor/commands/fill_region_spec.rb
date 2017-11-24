require 'spec_helper'
require 'pry'

module BitmapEditor
  module Commands
    RSpec.describe FillRegion do
      let(:bitmap) { Bitmap.new(4, 4)}

      def expected_equal_bitmap(bitmap, expected)
        expected.each_with_index do |row, x|
          row.each_with_index do |column, y|
            expect(bitmap.get(x, y)).to eql expected[y][x]
          end
        end
      end

      # Fill the region R with the colour C.
      # R is defined as: Pixel (X,Y) belongs to R.
      # Any other pixel which is the same colour as (X,Y)
      # and shares a common side with any pixel in R also
      # belongs to this region.
      describe '#fill_region' do
        context 'when the whole bitmap is of one colour' do
          it 'fills the whole bitmap with a given colour' do

            #   0 1 2 3 x
            # 0 O O O O
            # 1 O O O O
            # 2 O O O O
            # 3 O O O O
            # y
            command = FillRegion.new(bitmap, 3, 1, 'C')
            command.perform
            expected = [
              %w(C C C C),
              %w(C C C C),
              %w(C C C C),
              %w(C C C C),
            ]

          end
        end

        context 'when there is one pixel filled with a different colour' do
          it 'fills the surrounding region with a given colour' do
            bitmap.clear!
            bitmap.set(3, 2, 'A')
            #   0 1 2 3 x
            # 0 O O O O
            # 1 O O O O
            # 2 O O O A
            # 3 O O O O
            # y

            command = FillRegion.new(bitmap, 1, 1, 'B')
            command.perform
            expected = [
              %w(B B B B),
              %w(B B B B),
              %w(B B B A),
              %w(B B B B),
            ]
          end
        end


        context 'when there is more than one pixel filled with a different colour' do
          it 'fills a region with a given colour' do
            bitmap.set(0, 0, 'A')
            bitmap.set(3, 0, 'A')
            bitmap.set(1, 1, 'A')
            bitmap.set(2, 1, 'A')
            bitmap.set(0, 2, 'A')
            bitmap.set(1, 3, 'A')
            #   0 1 2 3
            # 0 A O O A
            # 1 O A A O
            # 2 A O O O
            # 3 O A O A

            command = FillRegion.new(bitmap, 3, 0, 'C')
            command.perform
            expected = [
              %w(C O O C),
              %w(O C C O),
              %w(C O O O),
              %w(O C O O),
            ]

            expected_equal_bitmap(bitmap, expected)
          end
        end

        context 'when the bitmap contains different colours' do
          it 'fills a region with a given colour' do
            bitmap.set(0, 0, 'A')
            bitmap.set(1, 0, 'B')
            bitmap.set(3, 0, 'A')

            bitmap.set(0, 1, 'A')
            bitmap.set(1, 1, 'A')
            bitmap.set(2, 1, 'B')
            bitmap.set(3, 1, 'B')

            bitmap.set(0, 2, 'A')
            bitmap.set(2, 2, 'A')
            bitmap.set(3, 2, 'B')

            bitmap.set(1, 3, 'B')
            bitmap.set(3, 3, 'A')
            #   0 1 2 3
            # 0 A B O A
            # 1 A A B B
            # 2 A O A B
            # 3 O B O A

            command = FillRegion.new(bitmap, 3, 3, 'C')
            command.perform
            expected = [
              %w(C B O A),
              %w(C C B B),
              %w(C O C B),
              %w(O B O C),
            ]

            expected_equal_bitmap(bitmap, expected)
          end
        end
      end
    end
  end
end
