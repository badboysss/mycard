#==============================================================================
# ■ Scene_Base
#------------------------------------------------------------------------------
# 　游戏中全部画面的超级类。
#==============================================================================

class Scene
  #--------------------------------------------------------------------------
  # ● 主处理
  #--------------------------------------------------------------------------
  def main
    start
    while $scene == self
      update
      sleep 0.01
    end
    terminate
  end
  #--------------------------------------------------------------------------
  # ● 开始处理
  #--------------------------------------------------------------------------
  def start
  end
  def refresh_rect(x, y, width, height, background=@background, ox=0,oy=0)
    Surface.blit(background,x+ox,y+oy,width,height,$screen,x,y)
    yield
    $screen.update_rect(x, y, width, height)
  end
  #--------------------------------------------------------------------------
  # ● 执行渐变
  #--------------------------------------------------------------------------
  def perform_transition
    Graphics.transition(10)
  end
  #--------------------------------------------------------------------------
  # ● 开始後处理
  #--------------------------------------------------------------------------
  def post_start
  end
  #--------------------------------------------------------------------------
  # ● 更新画面
  #--------------------------------------------------------------------------
  def update
     while event = Event.poll
       handle(event)
     end
  end
  def handle(event)
    case event
    when Event::Quit
      $scene = nil
    end
  end
  #--------------------------------------------------------------------------
  # ● 结束前处理
  #--------------------------------------------------------------------------
  def pre_terminate
  end
  #--------------------------------------------------------------------------
  # ● 结束处理
  #--------------------------------------------------------------------------
  def terminate
    $screen.fill_rect(0,0,$screen.w, $screen.h, 0xFF000000)
  end
end

