require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require_relative '../lib/grid'

class GridTest < MiniTest::Test

  attr_reader :grid

  def setup
    grid = [[23,34,34],[43,52,34]]
    @grid = Grid.new(grid)
  end

  def test_a_grid_can_be_stored_and_a_size_returned
    assert_equal 2, grid.height
    assert_equal 3, grid.length
  end

  def test_a_horizontal_product_can_be_calculated
    assert_equal 26588, grid.horizontal(0,0)
  end

end
