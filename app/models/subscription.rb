class Subscription < ActiveRecord::Base
	belongs_to :subscriber, class_name: "User"
	belongs_to :post, class_name: "Cposting"

	validates :post_id, presence: true 
	validates :subscriber_id, presence: true,
	:uniqueness => { :scope => :post_id }
	validate :class_not_full



def class_not_full
	errors.add(:post, "posting is already full!") unless !post.nil? && post.spots > post.subscriptions.count #stackoverflow answer
end

def date_in_future
  errors.add(:date, "date has to be in the future") unless !date.nil? && date > DateTime.now
end
#def not_overbooked?
#	 errors.add_to_base("Class is booked!") unless
#	 Subscription.where(post_id: self.post_id).count.to_i <= Cposting.find_by(id: self.post_id).spots.to_i #valid in console
#	end
#end

end
