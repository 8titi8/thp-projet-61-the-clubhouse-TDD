ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  module SignInHelper
    def sign_in_as(user)
      post signin_path(first_name: user.first_name,
                      last_name: user.last_name,
                      email: user.email, password: user.password)
    end

    def log_in_as(user)
      post loggedin_path(email: user.email, password: user.password)
    end
  end

end

class ActionDispatch::IntegrationTest
  include SignInHelper
  include SessionsHelper
end
