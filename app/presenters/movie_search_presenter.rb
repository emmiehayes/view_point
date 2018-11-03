class MovieSearchPresenter 

  def initialize(movie)
    @service = RecommendationService.new(movie)
    @movie = movie
  end

  def movies 
   @service.raw_search_results.map do |result|
      Movie.new(result)
    end
  end
end