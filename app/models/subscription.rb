class Subscription < ActiveRecord::Base
	belongs_to :subscriber, class_name: "User"
	belongs_to :post, class_name: "Cposting"

	validates :post_id, presence: true 
	validates :subscriber_id, presence: true,
	:uniqueness => { :scope => :post_id }



end
