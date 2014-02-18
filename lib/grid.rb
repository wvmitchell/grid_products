require 'pry'
class Grid

  attr_reader :grid_values

  def initialize(grid_values)
    #on refactor, add functionality to read grid from file
    @grid_values = grid_values
  end

  def height
    grid_values.length
  end

  def length
    grid_values.first.length
  end

  def horizontal(row, column, cells_to_use=nil)
    raise_unless_in_bounds(row, column)
    cells_to_use ||= length
    tail = column+cells_to_use-1
    (column..tail).to_a.collect {|col| grid_values[row][col] || 1}.reduce(:*)
  end

  def vertical(row, column, cells_to_use=nil)
    raise_unless_in_bounds(row, column)
    cells_to_use ||= height
    tail = row+cells_to_use-1
    grid_values[row..tail].collect {|r| r[column] || 1}.reduce(:*)
  end

  def diagonal_down(row, column, cells_to_use=nil)
    raise_unless_in_bounds(row, column)
    cells_to_use ||= height
    points_to_find = (row..cells_to_use-1).to_a.zip (column..cells_to_use-1).to_a
    values = []
    grid_values.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        values << cell if points_to_find.include?([i,j])
      end
    end
    values.reduce(:*)
  end

  def diagonal_up(row, column, cells_to_use=nil)
    raise_unless_in_bounds(row, column)

    if cells_to_use
      row_tail = row-cells_to_use < 0 ? 0 : row-cells_to_use
      column_tail = column+cells_to_use > length ? length-1 : column+cells_to_use
    else
      row_tail = 0
      column_tail = length-1
    end

    points_to_find = (row_tail..row).to_a.reverse.zip (column..column_tail).to_a

    values = []
    grid_values.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        values << cell if points_to_find.include?([i,j])
      end
    end
    values.reverse!

    if cells_to_use
      values.take(cells_to_use).reduce(:*)
    else
      values.reduce(:*)
    end
  end

  def raise_unless_in_bounds(row, col)
    if row < 0 || row >= height
      raise ArgumentError.new('Illegal row token')
    elsif col < 0 || col >= length
      raise ArgumentError.new('Illegal column token')
    end
  end

end
