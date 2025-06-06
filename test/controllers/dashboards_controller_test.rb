require "test_helper"

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)  # test_helper.rb に定義されたログインヘルパー
  end

  test "should get show" do
    get dashboard_url
    assert_response :success
  end
end
