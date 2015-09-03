class Subscription < ActiveRecord::Base
	belongs_to :subscriber, class_name: "User"
	belongs_to :post, class_name: "Cposting"

	validates :post_id, presence: true 
	validates :subscriber_id, presence: true,
	:uniqueness => { :scope => :post_id }
	validate :class_not_full
	validate :subscriber_is_customer


def class_not_full #checks if there are spots left for the posting.
	errors.add(:post, " is already full") unless !post.nil? && post.spots > post.subscriptions.count 
end 

def subscriber_is_customer
	errors.add(:subscriber, " is not a customer") unless !subscriber.company
end

end
