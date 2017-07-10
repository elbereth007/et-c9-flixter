# firehose track 4, lesson 18 - file created 17 jun 17 for lessons

class Lesson < ApplicationRecord
  belongs_to :section
  
# next line added 25 jun 17 for video upload (lesson 24)
  mount_uploader :video, VideoUploader
  
# next 2 lines added 28 jun 17 for reordering lessons (lesson 30)
  include RankedModel
  ranks :row_order, with_same: :section_id
  
# next_lesson method added 9 jul 17 for next lesson (lesson 37)
  def next_lesson
    lesson = section.lessons.where("row_order > ?", self.row_order).rank(:row_order).first
    if lesson.blank? && section.next_section
      return section.next_section.lessons.rank(:row_order).first
    end
    return lesson
  end
  
# previous_lesson method added 9 jul 17 for bonus to lesson 37
  def previous_lesson
    lesson = section.lessons.where("row_order < ?", self.row_order).rank(:row_order).last
    if lesson.blank? && section.previous_section
      return section.previous_section.lessons.rank(:row_order).last
    end
    return lesson
  end
  
end
