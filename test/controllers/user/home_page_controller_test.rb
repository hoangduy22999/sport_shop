require "test_helper"

class User::HomePageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_home_page_index_url
    assert_response :success
  end
end
