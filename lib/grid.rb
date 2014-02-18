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

  def horizontal
  end

end
