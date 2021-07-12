require 'test_helper'

class RocketControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rocket_index_url
    assert_response :success
  end

end
