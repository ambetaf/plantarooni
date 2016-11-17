require 'test_helper'

class HumiditySensorReadingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get humidity_sensor_reading_index_url
    assert_response :success
  end

end
