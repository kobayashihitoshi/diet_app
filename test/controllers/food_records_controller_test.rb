require "test_helper"

class FoodRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)
  end

  test "should get index" do
    get food_records_url
    assert_response :success
  end

  test "should get new" do
    get new_food_record_url
    assert_response :success
  end

  test "should create food record" do
    assert_difference("FoodRecord.count") do
      post food_records_url, params: {
        food_record: {
          name: "りんご",
          calories: 95,
          eaten_at: Time.zone.now
        }
      }
    end

    assert_redirected_to food_record_url(FoodRecord.last)
  end
end
