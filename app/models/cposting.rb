class Cposting < ActiveRecord::Base
  belongs_to :user #only belongs to company users
  has_many :subscriptions, 
  			foreign_key: "post_id", 
  			dependent: :destroy

  default_scope -> {order(created_at: :asc)}
  validates :content, presence: true
  validates :user_id, presence: true
  validates :spots, :numericality => { only_integer: true,
  									:greater_than_or_equal_to => 0,
  									:less_than_or_equal_to => 10}


end
