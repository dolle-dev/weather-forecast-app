# app/models/weather_forecast.rb
class WeatherForecast < ApplicationRecord
    validates :temperature, presence: true
    validates :high_temperature, numericality: { greater_than_or_equal_to: :temperature }, allow_nil: true
    validates :low_temperature, numericality: { less_than_or_equal_to: :temperature }, allow_nil: true
  
    after_initialize :set_default_temperature
  
    private
  
    def set_default_temperature
      self.temperature ||= 0
    end
  end
