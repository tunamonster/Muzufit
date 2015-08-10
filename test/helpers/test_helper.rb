ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

def log_in_as(user, options = {})
	post login_path, session: { email: user.email,
								password: password}
end

# Returns true if a test user is logged in.
def is_logged_in?
    !session[:user_id].nil?
end