class CreateWeatherForecasts < ActiveRecord::Migration[6.1]
  def change
    create_table :weather_forecasts do |t|
      t.integer :temperature
      t.integer :high_temperature
      t.integer :low_temperature

      t.timestamps
    end
  end
end
