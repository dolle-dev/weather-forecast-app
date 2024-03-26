# app/services/weather_forecast_service.rb
require 'httparty'

class WeatherForecastService
  #HERE I AM USING DUMMY KEY as I have to signup and subscribe to their plan
  API_KEY = '3343433JH23H4354JJR8'.freeze

  def initialize(address)
    @address = address
  end

  def fetch_forecast
    Rails.cache.fetch(cache_key, expires_in: 30.minutes) do
      response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{@address}&appid=#{API_KEY}&units=metric")
      if response.success?
        parse_forecast(response.parsed_response)
      else
        { error: 'Failed to fetch forecast data' }
      end
    end
  end

  private

  def cache_key
    "forecast_#{Digest::MD5.hexdigest(@address)}"
  end

  def parse_forecast(response)
    {
      temperature: response.dig('main', 'temp'),
      weather_description: response.dig('weather', 0, 'description'),
      humidity: response.dig('main', 'humidity'),
      wind_speed: response.dig('wind', 'speed')
    }
  end
end
