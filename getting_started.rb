def setup
  size 200, 200
  background 0
  no_stroke
  smooth
  @rotation = 0
  @tone = 0
  @ascend = true
end

def draw
  fill 0, 20
  rect 0, 0, width, height

  translate width/2, height/2
  rotate @rotation

  fill @tone, 1-@tone, 128
  ellipse 0, -60, 20, 20

  if @tone == 0
    @ascend = true
  end

  if @tone == 0 or @tone < 255 and @ascend
    rate = 1
  else
    @ascend = false
    rate = -1
  end

  @rotation += 0.1
  @tone += rate

end
