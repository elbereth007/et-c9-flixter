# firehose track 4, lesson 17 - file created 16 jun 17 for sections

class Section < ApplicationRecord
  belongs_to :course
  
# added 17 jun 17 for lessons
  has_many :lessons
  
# next 2 lines added 5 jul 17 for reordering sections (lesson/challenge 32)
  include RankedModel
  ranks :row_order, with_same: :course_id
  
# next_section method added 9 jul 17 for next lesson button (lesson 37)
  def next_section
    section = course.sections.where("row_order > ?", self.row_order).rank(:row_order).first
    return section
  end
  
# add code for previous lesson section
  
  
end
