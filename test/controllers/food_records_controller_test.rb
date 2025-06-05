require "test_helper"

class FoodRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get food_records_index_url
    assert_response :success
  end

  test "should get new" do
    get food_records_new_url
    assert_response :success
  end

  test "should get create" do
    get food_records_create_url
    assert_response :success
  end
end
