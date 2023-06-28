require "test_helper"

class HikeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hike_index_url
    assert_response :success
  end
end
