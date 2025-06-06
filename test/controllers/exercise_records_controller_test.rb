require "test_helper"

class ExerciseRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)  # test_helper.rb で定義されていることが前提
  end

  test "should get index" do
    get exercise_records_url
    assert_response :success
  end

  test "should get new" do
    get new_exercise_record_url
    assert_response :success
  end

  test "should create exercise record" do
    assert_difference("ExerciseRecord.count") do
      post exercise_records_url, params: {
        exercise_record: {
          name: "ランニング",
          duration_minutes: 30,
          calories_burned: 300,
          exercised_at: Time.zone.now
        }
      }
    end

    assert_redirected_to exercise_record_url(ExerciseRecord.last)
  end
end
