require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_url  # または get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count", 1) do
      post users_url, params: {
        user: {
          name: "Test_User",
          email: "test1@example.com",
          password: "password",
          password_confirmation: "password",
          current_weight: 80,
          target_weight: 70,
          age: 30,
          gender: "male"
        }
      }
    end

    assert_redirected_to dashboard_url # 登録後のリダイレクト先に応じて修正
  end
end
