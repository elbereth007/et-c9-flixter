# firehose track 4, lesson 17 - file created 16 jun 17 for sections

class Section < ApplicationRecord
  belongs_to :course
  
# added 17 jun 17 for lessons
  has_many :lessons
  
# next 2 lines added 5 jul 17 for reordering sections (lesson/challenge 32)
  include RankedModel
  ranks :row_order, with_same: :course_id
end
