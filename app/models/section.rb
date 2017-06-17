# firehose track 4, lesson 17 - file created 16 jun 17 for sections

class Section < ApplicationRecord
  belongs_to :course
  
# added 17 jun 17 for lessons
  has_many :lessons
end
