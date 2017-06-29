# firehose track 4, lesson 13 - file created 16 jun 17 for courses

class Course < ApplicationRecord
  
# next line added 23 jun 17 - mounts uploader for lesson 22 (challenge)
  mount_uploader :image, ImageUploader
    
  belongs_to :user
  has_many :sections
  
# next line added 26 jun 17 for student enrollment (lesson 27)
  has_many :enrollments
  
  validates :title, presence: true
  validates :description, presence: true
  validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}
  
# next 6 lines added 28 jun 17 for bypassing payment info for free course (lesson 29)
  def free?
    cost.zero?
  end
  
  def premium?
    ! free?
  end
    
end
