require 'ruby2d'



@square = Square.new(x: 10, y: 20, size: 25, color: 'blue')
@x_speed = 0
@y_speed = 0
@slug = Image.new('images/sea_slug.jpg', x: 10, y: 10)
hi_hat = Music.new('sounds/hi_hat.mp3', loop: true)
boarder = Sprite.new(
  'images/kickflip.png', 
  width: 160,
  height: 160,
  clip_width: 160,
  time: 300,
  animations: {
    board: 0..1,
    flip: 0..7
  }
)

hi_hat.play


on :key_down do |event|
    if event.key == 'j'
      @x_speed = -2
      @y_speed = 0
      boarder.play animation: :board, loop: true, flip: :horizontal
    elsif event.key == 'l'
      @x_speed = 2
      @y_speed = 0
      boarder.play animation: :board, loop: true
    elsif event.key == 'i'
      @x_speed = 0
      @y_speed = -2
      boarder.play animation: :flip
    elsif event.key == 'k'
      @x_speed = 0
      @y_speed = 2
      boarder.play animation: :flip, flip: :vertical
    end
  end

tick = 0
update do
    if tick % 60 == 0
        set background: 'random'
    end
    x = get :mouse_x
    y = get :mouse_y

    boarder.x += @x_speed
    boarder.y += @y_speed

    tick += 1
end

set title: "Ho there", background: 'random'

show