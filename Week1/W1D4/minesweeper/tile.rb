class Tile

  attr_accessor :visible, :bomb, :bomb_idx

  def initialize(bomb, visible, bomb_idx = 0 )
    @bomb = bomb
    @visible = visible
    @bomb_idx = bomb_idx
    @flagged = false
  end

  def reveal
    @visible = true
  end

  def flag
    @flagged = true
  end

  def add_bomb
    @bomb_idx +=1
  end


end
