require 'test_helper'

class UserSubscriptionTest < ActionDispatch::IntegrationTest
	include ApplicationHelper

def log_in_as(user, options = {})  #copy pasted from test_helper. This test doesn't access test_helper
	post login_path, session: { email: user.email,
								name: @user.name
								password: 'password'}
end


def is_logged_in? #copy pasted from test_helper. This test doesn't access test_helper
    !session[:user_id].nil?
end

def setup
	@user = users(:customer)
	@cposting = cpostings(:one)

end


test "subscribe as customer" do 

	log_in_as(@user)
	assert is_logged_in?
	get cposting_path(@cposting) 
	
end

#log in as customer
#confirm logged in 
#access cposting (def) page 
#confirm it exists
#sign up
#confirm new subscription is built


end
