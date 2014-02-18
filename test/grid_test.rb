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

  def test_a_horizontal_product_of_less_numbers_than_full_length_can_be_calculated
    assert_equal 782, grid.horizontal(0,0,2)
  end

  def test_horizontal_edge
    assert_equal 34, grid.horizontal(1,2,2)
  end

  def test_vertical_edge
    assert_equal 989, grid.vertical(0,0)
  end

end
