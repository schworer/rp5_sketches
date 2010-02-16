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
  cur_cell = @cells[i]
  x,y,on = cur_cell

  north = x > 0 ? @cells[i-@xcells] : nil
  south = x < @xcells ? @cells[i+@xcells] : nil
  east = y > 0 ? @cells[i-1] : nil
  west = y < @ycells ? @cells[i+1] : nil
  return north, south, east, west
end

# xcells = 4
# ycells = 4
# ncells = 16
# to get -y cell at 0,1 add @xcells+index = 5
# to get +y cell at 1,2 subtract @xcells from index to = 2
# to get -x cell at 0,1 subtract -1 from index if y > 0 = 0
# to get +x cell at 2,2 add +1 if y < @ycells
# 0,0 0,1 0,2 0,3 # 0, 1, 2, 3,
# 1,0 1,1 1,2 1,3 # 4, 5, 6, 7
# 2,0 2,1 2,2 2,3 # 8, 9, 10, 11
# 3,0 3,1 3,2 3,3 # 12, 13, 14, 15

def update_cells
  @cells.each_with_index do |v, i|
    n,s,e,w = get_neighbors i
    x, y, on = v
    if n and n[2]
      @cells[i][2] = !on
    end
  end
end

def draw_cell x, y
  rect x*CELL_SIZE, y*CELL_SIZE, CELL_SIZE, CELL_SIZE
end

