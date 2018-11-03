class MovieSearchPresenter 

  def initialize(movie)
    @movie = movie
  end

  def movies 
    @conn = Faraday.new(url: 'http://tastedive.com') do |faraday|
    faraday.adapter Faraday.default_adapter
  end
    response = @conn.get("/api/similar?q=#{@movie}&k=#{ENV["TASTEDIVE_API_KEY"]}&verbose=1&info")
    search_movie = JSON.parse(response.body, symbolize_names: true)[:similar][:info]
    results = JSON.parse(response.body, symbolize_names: true)[:results]

    @movies  = results.map do |result|
      Movie.new(result)
    end
  end
end