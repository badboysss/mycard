#==============================================================================
# ■ Scene_Title
#------------------------------------------------------------------------------
# 　title
#==============================================================================

class Window_PlayerList < Window_List
  attr_reader :x, :y, :width, :height
  WLH = 16
	def initialize(x, y)
    super(x,y,272,16*34)
    @font = TTF.open("fonts/WenQuanYi Micro Hei.ttf", WLH)
    @color = [0x03, 0x11, 0x22]
    @color_over = [0x03, 0x11, 0x22, 200,200,255]
    @color_click = [200,200,255, 0x03, 0x11, 0x22]
	end
  def draw_item(index, status=0)
    case status
    when 0
      @font.draw_blended_utf8($screen, @list[index].name, @x, @y+index*WLH, *@color)
    when 1
      @font.draw_shaded_utf8($screen, @list[index].name, @x, @y+index*WLH, *@color_over)
    when 2
      @font.draw_shaded_utf8($screen, @list[index].name, @x, @y+index*WLH, *@color_click)
    end
  end
  def item_rect(index)
    [@x, @y+WLH*index, @width, WLH]
  end
  def list=(list)
		@list = list
    @item_max = [@list.size, 34].min
    @height = @item_max * WLH
		refresh
	end
  def clicked
    $scene.refresh_rect(*item_rect(@index)){draw_item(@index, 2)} if @index
    @userwindow = Window_User.new(100,100,@list[@index])
  end
  def mousemoved(x,y)
    return unless include?(x,y)
    if (y-@y) / 24 < @item_max
      self.index = (y - @y) / WLH
    end
  end
end