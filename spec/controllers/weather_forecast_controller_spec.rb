# spec/controllers/forecast_controller_spec.rb
require 'rails_helper'

RSpec.describe ForecastController, type: :controller do
  describe 'GET #index' do
    context 'with valid address' do
      let(:forecast_data) { { temperature: 20 } }

      before do
        allow_any_instance_of(WeatherForecastService).to receive(:fetch_forecast).and_return(forecast_data)
        get :index, params: { address: 'New York' }
      end

      it 'assigns forecast data' do
        expect(assigns(:forecast)).to eq(forecast_data)
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'with invalid address' do
      before do
        allow_any_instance_of(WeatherForecastService).to receive(:fetch_forecast).and_return({ error: 'Invalid address' })
        get :index, params: { address: 'Invalid Address' }
      end

      it 'assigns an error message' do
        expect(assigns(:forecast)).to eq({ error: 'Invalid address' })
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end
  end
end
