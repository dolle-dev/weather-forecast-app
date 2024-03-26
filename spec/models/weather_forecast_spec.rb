# spec/models/weather_forecast_spec.rb
require 'rails_helper'

RSpec.describe WeatherForecast, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:temperature) }
    it { should validate_numericality_of(:high_temperature).is_greater_than_or_equal_to(:temperature).allow_nil }
    it { should validate_numericality_of(:low_temperature).is_less_than_or_equal_to(:temperature).allow_nil }
  end

  describe 'callbacks' do
    describe '#set_default_temperature' do
      context 'when temperature is not provided' do
        it 'sets default temperature to 0' do
          weather_forecast = WeatherForecast.new
          expect(weather_forecast.temperature).to eq(0)
        end
      end

      context 'when temperature is provided' do
        it 'does not change the temperature value' do
          weather_forecast = WeatherForecast.new(temperature: 25)
          expect(weather_forecast.temperature).to eq(25)
        end
      end
    end
  end
end
