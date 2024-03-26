# app/controllers/weather_forecasts_controller.rb
class WeatherForecastsController < ApplicationController
  def index
    address = params[:address]
    weather_forecast_service = WeatherForecastService.new(address)
    @forecast = weather_forecast_service.fetch_forecast
    @from_cache = Rails.cache.read(weather_forecast_service.cache_key).present?
  end
end
