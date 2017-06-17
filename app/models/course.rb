# firehose track 4, lesson 13 - file created 16 jun 17 for courses

class Course < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates :description, presence: true
  validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}
end
