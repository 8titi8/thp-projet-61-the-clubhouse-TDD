require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:peter)
  end

  test "inscription pas possible si champ manquant avec message d'erreur" do
    get signup_path
    post users_path, params: { last_name: "Pan",
                              email: "pan@mail.com",
                              password: "",
                              password_confirmation: "123456"
                            }
    assert_select "div.alert", nil,  "un user ne peut pas s'inscrire sans tous les champs et un message doit apparaitre"
  end

  test "doit afficher la page d'inscription" do
    get signup_path
    assert_response :success
  end

  test "le compte utilisateur doit etre supprime" do
    sign_in_as(users(:peter))
    delete logout_path
    follow_redirect!
    assert_equal home_path, path
  end


end
