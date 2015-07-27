require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
	def setup
		@user = User.new(name: "Foo", email: "bbbbb@aa.cc", password: "edcedcedc")
	end

  test "login invalid, get flash and redirect" do
  	get login_path
  	assert_template 'sessions/new'
  	post login_path, session: {email: @user.email, password: ""}
  	assert_template 'sessions/new'
  	assert_not flash.empty? 
  	get root_path
  	assert flash.empty?
  end 
  # test "the truth" do
  #   assert true
  # end
end
