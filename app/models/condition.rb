class Condition 

  def initialize(condition)
    @condition = condition
  end

  def moonrise 
    condition[:astro][:moonrise]
  end

  def sunset
    condition[:astro][:sunset]
  end

  def day 
    condition[:date].to_datetime.strftime('%A')
  end

  def date 
    condition[:date].to_datetime.strftime('%b %d')
  end

  def low 
    condition[:day][:mintemp_f].round
  end 

  def high 
    condition[:day][:maxtemp_f].round
  end 

  def description 
    condition[:day][:condition][:text]
  end
  
  def max_winds 
    condition[:day][:maxwind_mph]
  end

  def icon 
    path = (@condition[:day][:condition][:icon])
    path.slice!('//cdn.apixu.com/') 
    path
  end

  private 
  attr_reader :condition
end