# firehose track 4, lesson 13 - file created 16 jun 17 for courses

class Course < ApplicationRecord
  belongs_to :user
  has_many :sections
  
  validates :title, presence: true
  validates :description, presence: true
  validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}
  
# next line added 23 jun 17 - mounts uploader for lesson 22 (challenge)
    mount_uploader :image, ImageUploader
    
end
