class RecommendedMovie

  def initialize(data)
    @data = data 
  end

  def y_id
    data[:yID]
  end

  def title
    data[:Name]
  end

  def summary 
    data[:wTeaser]
  end

  def trailer_url
    data[:yUrl]
  end

  private
  attr_reader :data
end