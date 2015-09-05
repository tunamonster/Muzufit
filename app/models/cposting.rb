class Cposting < ActiveRecord::Base

  include PgSearch
  multisearchable :against => [:title, :content]

  extend SimpleCalendar
  has_calendar attribute: :starts_at #uses starts_at (default) column as value


  belongs_to :user
  has_many :subscriptions,
  			foreign_key: "post_id",
  			dependent: :destroy

  default_scope -> {order(starts_at: :asc)}
  mount_uploader :picture, PictureUploader
  validates :content, presence: true
  validates :user_id, presence: true
  validates_uniqueness_of :content, :scope => :starts_at
  validates :spots, :numericality => { only_integer: true,
  									:greater_than_or_equal_to => 1,
  									:less_than_or_equal_to => 10}

  VALID_TIME_REGEX = /\A[0-2][0-9]:[0-5][0-9]\z/
  #validates :class_time, format: { with: VALID_TIME_REGEX }
#  validate :date_in_future
  validate :picture_size


attr_accessor :class_date, :class_time #split date into date and time
before_validation :set_datetimes #convert accessors back to db format


def set_datetimes
  self.starts_at = "#{self.class_date} #{self.class_time}:00" #convert fields back to db format
end

def spots_left #returns the number of places left in this class
  self.spots - self.subscriptions.count
end

def full_class? #returns true if there are no spots left for this class
  self.spots_left == 0
end

def convert_to_datetime #convert the datepicker form in /new to datetime
      DateTime.parse(self.starts_at)
end

def date_in_future
  errors.add(:starts_at, " has to be in the future") unless !self.starts_at.nil? && self.starts_at > DateTime.now 
end

  private

  # Validates the size of an uploaded picture.
         def picture_size
       if picture.size > 5.megabytes
         errors.add(:picture, "should be less than 5MB")
       end
     end
end
