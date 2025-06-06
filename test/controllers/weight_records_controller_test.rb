require "test_helper"

class WeightRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)
  end

  test "should get index" do
    get weight_records_url
    assert_response :success
  end

  test "should get new" do
    get new_weight_record_url
    assert_response :success
  end

  test "should create weight record" do
    assert_difference('WeightRecord.count', 1) do
      post weight_records_url, params: {
        weight_record: {
          recorded_on: Date.today,
          weight: 80,
          user_id: @user.id
        }
      }
    end
    assert_redirected_to weight_record_path(WeightRecord.last)
  end
end
