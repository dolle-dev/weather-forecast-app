require "test_helper"

class WeatherForecastsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get weather_forecasts_show_url
    assert_response :success
  end
end
