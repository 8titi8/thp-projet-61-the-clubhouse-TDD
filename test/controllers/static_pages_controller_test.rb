require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:peter)
  end
  test "doit pouvoir acceder a la page home" do
    get home_path
    assert_response :success
  end

  test "affiche home avec lien login si user non connecte" do
    get home_path
    assert_select "a", "connecter", "doit contenir le lien login"
  end

end
