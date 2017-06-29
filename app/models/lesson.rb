# firehose track 4, lesson 18 - file created 17 jun 17 for lessons

class Lesson < ApplicationRecord
  belongs_to :section
  
# next line added 25 jun 17 for video upload (lesson 24)
  mount_uploader :video, VideoUploader
  
# next 2 lines added 28 jun 17 for reordering lessons (lesson 30)
  include RankedModel
  ranks :row_order, with_same: :section_id
  
end
