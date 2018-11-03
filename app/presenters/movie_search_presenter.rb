class MovieSearchPresenter 

  def initialize(movie)
    @movie = movie
  end

  def movies 
    @conn = Faraday.new(url: 'https://tastedive.com') do |faraday|
    faraday.adapter Faraday.default_adapter
  end
    response = @conn.get("/api/similar?q=#{@movie}&k=#{ENV["TASTEDIVE_API_KEY"]}&verbose=1&info")
    search_movie = JSON.parse(response.body, symbolize_names: true)[:Similar][:Info]
    results = JSON.parse(response.body, symbolize_names: true)[:Similar][:Results]

    @movies  = results.map do |result|
      Movie.new(result)
    end
  end
end