require "test_helper"

class ExerciseRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get exercise_records_index_url
    assert_response :success
  end

  test "should get new" do
    get exercise_records_new_url
    assert_response :success
  end

  test "should get create" do
    get exercise_records_create_url
    assert_response :success
  end
end
