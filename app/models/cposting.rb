class Cposting < ActiveRecord::Base
  belongs_to :user 
  has_many :subscriptions, 
  			foreign_key: "post_id", 
  			dependent: :destroy

  default_scope -> {order(created_at: :asc)}
  validates :content, presence: true
  validates :user_id, presence: true
  validates :spots, :numericality => { only_integer: true,
  									:greater_than_or_equal_to => 1,
  									:less_than_or_equal_to => 10}


def spots_left #returns the number of places left in this class
  self.spots - self.subscriptions.count
end

def full_class? #returns true if there are no spots left for this class
  self.spots_left == 0
end
  
  private

end
