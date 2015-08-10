require 'test_helper'

class UserSubscriptionTest < ActionDispatch::IntegrationTest
include ApplicationHelper


def setup
	@user = users(:customer)
	@cposting = cpostings(:one)
	#log_in_as(@user) test helper won't load

end


test "subscribe as customer" do 


	
end

#log in as customer
#confirm logged in 
#access cposting (def) page 
#confirm it exists
#sign up
#confirm new subscription is built


end
