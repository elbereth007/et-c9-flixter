# firehose track 4, lesson 22 (challenge) - file created 23 jun 17 for image upload

class AddImageToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :image, :string
  end
end
