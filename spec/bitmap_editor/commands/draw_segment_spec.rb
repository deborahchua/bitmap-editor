# require 'spec_helper'
# require './lib/bitmap_editor'
#
# module BitmapEditor
#   RSpec.describe Bitmap do
#     let(:bitmap) { Bitmap.new(4, 5) }
#
#     describe '#draw_horizontal_segment' do #X1 X2 Y C
#       it 'fills a horizontal segment with a given colour (inclusively between x1 and x2)' do
#         bitmap.draw_horizontal_segment(1, 3, 2, "A")
#         #  y
#         #  O O O O
#         #  O O O O
#         #  O A A A
#         #  O O O O x
#
#         expect(bitmap.get(1, 2)).to eql "A"
#         expect(bitmap.get(2, 2)).to eql "A"
#         expect(bitmap.get(3, 2)).to eql "A"
#
#         expect(bitmap.get(0, 2)).to eql "O"
#       end
#     end
#
#
#   end
# end
