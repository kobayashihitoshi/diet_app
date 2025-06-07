require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)  # users.yml に事前定義されたユーザーが必要です
  end

  test "should get login form" do
    get login_url
    assert_response :success
  end

  test "should log in user" do
    post login_url, params: {
      session: {
        email: @user.email,
        password: "password"  # fixtures で設定したパスワードに合わせる
      }
    }
    assert_redirected_to dashboard_url  # ログイン後にリダイレクトされる先
  end

  test "should log out user" do
    log_in_as(@user)
    delete logout_url
    assert_redirected_to login_url  # ログアウト後にリダイレクトされる先
  end
end
