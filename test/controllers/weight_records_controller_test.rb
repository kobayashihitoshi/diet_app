require "test_helper"

class WeightRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weight_records_index_url
    assert_response :success
  end

  test "should get new" do
    get weight_records_new_url
    assert_response :success
  end

  test "should get create" do
    get weight_records_create_url
    assert_response :success
  end
end
