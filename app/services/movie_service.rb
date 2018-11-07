class MovieService

  def initialize(search_params)
    @movie = search_params[:movie]
  end

  def raw_movie_results
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
    conn.get("/api/similar?q=#{movie}&k=#{ENV["TASTEDIVE_API_KEY"]}&verbose=1&info&limit=5")
  end
end