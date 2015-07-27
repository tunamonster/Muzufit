require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup 
  	@user = User.new(name: "Example User", email: "example@e.mail", password: "abcabc", password_confirmation: "abcabc")
  end

   test "name should not be too long" do
   	@user.name = "a"*51
   	assert_not @user.valid?
   end

   test "name should exist" do
   @user.name =  nil
   assert_not @user.valid?
   end

   test "email should exist" do
   	@user.email = nil
   	assert_not @user.valid?
   end

   test "email should be unique" do
   	@user2 = User.new( name: @user.name, email: @user.email)
   	assert_not @user2.valid?
   end

   test "password should exist" do
   	@user.password = @user.password_confirmation = nil
   	assert_not @user.valid?
   end

   test "password should be longer than 6 characters" do
   	@user.password = @user.password_confirmation = "a" * 5
   	assert_not @user.valid?
   end

end
