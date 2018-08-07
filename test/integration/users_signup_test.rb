require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:peter)
  end

  test "inscription pas possible si champ manquant avec message d'erreur" do
    get signup_path
    post signin_path, params: { last_name: "Pan",
                              email: "pan@mail.com",
                              password: "",
                              password_confirmation: "123456"
                            }
    assert_response :success
    assert_select "div.alert", nil,  "un user ne peut pas s'inscrire sans tous les champs et un message doit apparaitre"
    assert_equal signup_path, path
  end

  test "informations valides et connexion possible" do
    get signup_path
    post signin_path, params: { first_name: "Peter",
                              last_name: "Pan",
                              email: "pan@mail.com",
                              password: "123456",
                              password_confirmation: "123456"
                            }
    assert_response :redirect
  end

  test "affiche home avec lien club si user connecte" do
    get login_path
    post loggedin_path, params: { email: @user.email, password: @user.password }

    get home_path
    assert_select "a", users_path, "doit contenir le lien club"
  end

end
