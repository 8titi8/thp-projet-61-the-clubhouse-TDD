require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:peter)
  end

  test "connexion si email et password sont bons" do
    log_in_as(@user)
    assert_response :success
  end

  test "doit se deconnecter" do
    delete logout_path
    follow_redirect!
    assert_equal home_path, path
  end

end
