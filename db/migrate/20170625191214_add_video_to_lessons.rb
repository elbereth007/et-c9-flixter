# firehose track 4, lesson 24 - file created 25 jun 17 for video upload to lessons

class AddVideoToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :video, :string
  end
end
