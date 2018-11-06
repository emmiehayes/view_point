class WeatherService

  def initialize(search_params)
    @zipcode = search_params[:zipcode]
  end

  def raw_weather_results
    JSON.parse(response.body, symbolize_names: true)[:forecast][:forecastday]
  end

  private 
  attr_reader :zipcode
  
  def response 
    conn.get("/v1/forecast.json?key=#{ENV['APIXU_API_KEY']}&q=#{zipcode}&days=7")
  end

  def conn 
    Faraday.new(url: 'http://api.apixu.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
