# Conway's game of life
CELL_SIZE = 3
INIT_DENSITY = 0.8
RATE = 3

def setup
  width = 300
  height = 300
  @xcells = width/CELL_SIZE
  @ycells = height/CELL_SIZE
  size width, height
  background 0
  frame_rate RATE
  @cells = []
  plot_cells_rand
end

def plot_cells_rand
  @xcells.times do |x|
    @ycells.times do |y|
      on = rand < INIT_DENSITY
      if on
        draw_cell x, y
      end
      @cells << [x, y, on]
      #@cells << Vector.new(x, y)
    end
  end
end

def draw
  update_cells
  draw_cells
end

def draw_cells
  @cells.each do |c|
    x, y, on = c
    if on
      fill 255
      draw_cell x, y
    else
      fill 0
      draw_cell x, y
    end
  end
end

def get_neighbors i
  xrow = @cells[i][0] +1
  ycol = @cells[i][1] +1
  if xrow*ycol - 1 == i
    return xrow, ycol
  end
end

def update_cells
  @cells.each_with_index do |v, i|
    get_neighbors i
    prev_cell = @cells[i-1]
    x, y, on = v
    if prev_cell[2]
      @cells[i][2] = !on
    end
  end
end

def draw_cell x, y
  rect x*CELL_SIZE, y*CELL_SIZE, CELL_SIZE, CELL_SIZE
end

