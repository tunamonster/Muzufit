require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  def setup
    @cposting = cpostings(:one) #has one spot
    @customer = users(:customer)
    @customer2 = users(:customer2)
    @subscription = Subscription.new(post_id: @cposting.id, subscriber_id: @customer.id)

  end

  test "should be valid" do
  	assert @subscription.valid?
  end

  test "should require a post_id" do
  	@subscription.post_id = nil
  	assert_not @subscription.valid?
  end

  test "should require subscriber_id" do 
  	@subscription.subscriber_id = nil
  	assert_not @subscription.valid?
  end

  test "post_id and subscriber_id pair should be unique" do
  	assert @subscription.valid?
  	@subscription.save
  	@subscription2 = Subscription.new(post_id: @subscription.post_id, subscriber_id: @subscription.subscriber_id)
  	assert_not @subscription2.valid?
  end

  test "subscriptions cannot exceed spots" do
    @subscription.save
    assert @cposting.subscriptions.count == @cposting.spots 
    @cposting.build_subscription(subscriber: @customer2) 
    assert_not @subscription2.valid?
  end

end
