class Cposting < ActiveRecord::Base

  include PgSearch

  multisearchable :against => [:title, :content]
  
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

  VALID_TIME_REGEX = /\A[0-2][0-4]:[0-5][0-9]\z/
  validates :class_time, format: { with: VALID_TIME_REGEX }


attr_accessor :class_date, :class_time #split date into date and time
#after_initialize :get_datetimes #convert db format to accessors
before_validation :set_datetimes #convert accessors back to db format

def get_datetimes
  self.class_date ||= self.date.to_date.to_s(:db) #extract date to yyyy-mm-dd
  self.class_time ||= "#{'%02d' % self.date.hour }:#{'%02d' % self.date.min}" #extract the time
end

def set_datetimes
  self.date = "#{self.class_date} #{self.class_time}:00" #convert fields back to db format
end


def spots_left #returns the number of places left in this class
  self.spots - self.subscriptions.count
end

def full_class? #returns true if there are no spots left for this class
  self.spots_left == 0
end
  
  private

  def convert_to_datetime #convert the datepicker form in /new to datetime
      DateTime.parse(self.date)
  end
end
