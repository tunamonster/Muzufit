require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
  end

  test "valid signup should redirect to user page" do
    get signup_path
    assert_difference 'User.count' do 
       post users_path, user: { name:  "foo",
                               email: "foo@foo.foo",
                               password:              "foofoo",
                               password_confirmation: "foofoo" }
  end
  assert_template 'users/show' #not sure if this is the corrext syntax to indicate the newly created user 
end

end