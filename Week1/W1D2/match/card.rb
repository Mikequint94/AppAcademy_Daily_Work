class Card

  attr_accessor :value

  def initialize(value)
    @value = value
    @visible = false
  end

  def visible?
    @visible
  end

  def reveal
    @visible = true
  end

  def hide
    @visible = false
  end

  def value
    @value
  end

end
