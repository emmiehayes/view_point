class MovieSearchPresenter 

  def initialize(movie)
    @service = RecommendationService.new(movie)
  end

  def movies 
   service.raw_search_results.map do |result|
      RecommendedMovie.new(result)
    end
  end

  private
  attr_reader :service
end