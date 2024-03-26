# spec/services/weather_forecast_service_spec.rb
require 'rails_helper'

RSpec.describe WeatherForecastService do
  describe '#fetch_forecast' do
    context 'when the API call is successful' do
      let(:address) { 'New York' }
      let(:response_body) do
        {
          'main' => { 'temp' => 25 }
        }
      end

      before do
        allow(HTTParty).to receive(:get).and_return(instance_double(HTTParty::Response, success?: true, parsed_response: response_body))
      end

      it 'returns the forecast data' do
        forecast_service = WeatherForecastService.new(address)
        forecast = forecast_service.fetch_forecast
        expect(forecast[:temperature]).to eq(25)
      end
    end

    context 'when the API call fails' do
      let(:address) { 'Invalid Address' }

      before do
        allow(HTTParty).to receive(:get).and_return(instance_double(HTTParty::Response, success?: false))
      end

      it 'returns an error message' do
        forecast_service = WeatherForecastService.new(address)
        forecast = forecast_service.fetch_forecast
        expect(forecast[:error]).to be_present
      end
    end
  end
end
