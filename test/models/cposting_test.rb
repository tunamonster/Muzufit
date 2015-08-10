require 'test_helper'

class CpostingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@company = users(:company)
  	@customer = users(:customer)
  	@cposting = Cposting.new(content: "doodoo", spots: 2, user_id: @company.id)  	
  end

  test "valid if user is company" do 
  	assert @cposting.valid?
  end

  test "invalid if spots is not 0..10" do
    @cposting.spots = 11
    assert_not @cposting.valid?
  end

  test "invalid if spots is not integer" do
    @cposting.spots = 3.14159265359 #i i i, i love apple π
    assert_not @cposting.valid?
  end

  test "invalid if user is customer" do
  	@cposting.user_id = @customer.id 
  	assert_not @cposting.valid?
  end
  
end
