require "test_helper"

class GraphsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one) # test/fixtures/users.yml に定義がある前提
    log_in_as(@user)    # このメソッドは test/test_helper.rb に定義しておく
  end

  test "should get index" do
    get graphs_url
    assert_response :success
  end
end
