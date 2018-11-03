class RecommendationService

  def initialize(movie)
    @movie = movie
  end

  def raw_search_movie
    parse_json[:Similar][:Info]
  end

  def raw_search_results
    parse_json[:Similar][:Results]
  end

  private
  attr_reader :movie

  def parse_json
    JSON.parse(response.body, symbolize_names: true)
  end

    def conn 
    Faraday.new(url: 'https://tastedive.com') do |faraday|
    faraday.adapter Faraday.default_adapter
    end
  end

  def response
    conn.get("/api/similar?q=#{movie}&k=#{ENV["TASTEDIVE_API_KEY"]}&verbose=1&info")
  end
end