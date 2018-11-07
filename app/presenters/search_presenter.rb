class SearchPresenter 

  def initialize(search_params)
    @movie_service = MovieService.new(search_params)
    @weather_service = WeatherService.new(search_params)
  end

  def movies 
   movie_service.raw_movie_results.map do |result|
      RecommendedMovie.new(result)
    end
  end

  def forecast
    weather_service.raw_weather_results.map do |result|
      Condition.new(result)
    end
  end

  private
  attr_reader :movie_service, :weather_service
end