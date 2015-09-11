class Template < ActiveRecord::Base
	belongs_to :user

	validates :content, presence: true,
				uniqueness: {scope: :title} #prevent spam clicking for multiple entries
	validates :title, presence: true
	mount_uploader :picture, PictureUploader
	validate :picture_size
private

     def picture_size
       if picture.size > 5.megabytes
         errors.add(:picture, "should be less than 5MB")
       end
     end
	
end
