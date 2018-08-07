require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: "Capitaine", last_name: "Crochet", email: "crochet@mail.com", password: "123456", password_confirmation: "123456")
  end

    test "doit etre valide" do
      assert @user.valid?, "enregistrement du user doit etre valide"
    end

    test "prenom doit present" do
      @user.first_name = "     "
      assert_not @user.valid?, "user doit avoir un prenom"
    end

    test "prenom ne doit pas etre trop long" do
      @user.first_name = "a" * 65
      assert_not @user.valid?, "prenom de doit pas depasser 50 characteres"
    end

    test "email doit etre present" do
      @user.email = "     "
      assert_not @user.valid?, "user doit avoir un email"
    end

    test "email ne doit pas etre trop long" do
      @user.email = "a" * 260 + "@mail.com"
      assert_not @user.valid?, "email de doit pas depasser 255 characteres"
    end

    test "email doit etre unique" do
      duplicate_user = @user.dup
      @user.save
      assert_not duplicate_user.valid?, "email ne peut pas etre utiliser deux fois"
    end

    test "email doit etre enregistre en minuscule" do
      wrong_email = "PetEr@MAil.CoM"
      @user.email = wrong_email
      @user.save
      assert_equal wrong_email.downcase, @user.reload.email, "email ne s'enregistre qu'en minuscule"
    end

    test "email ok" do
      valid_addresses = %w[peter@mail.com PETER@mail.COM P_ET-ER@pan.mail.org
                     first.last@mama.dp peter+pan@lol.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        assert @user.valid?, "#{valid_address.inspect} doit etre valide"
      end
    end

    test "validation d'email doit rejeter les emails invalides" do
      invalid_addresses = %w[peter@mail,com peter_and_pan.org peter.pan@mail.
                       peter@pan_mail.com peter@pan+mail.com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        assert_not @user.valid?, "#{invalid_address.inspect} doit etre invalide"
      end
    end

    test "password doit etre present et non blanc" do
      @user.password = @user.password_confirmation = " " * 6
      assert_not @user.valid?, "doit y avoir un mot de passe et ne peut pas etre blanc"
    end

    test "password doit avoir minimum 6 characteres" do
      @user.password = @user.password_confirmation = "a" * 5
      assert_not @user.valid?, "mot de passe doit etre plus long que 6 characteres"
    end

end
