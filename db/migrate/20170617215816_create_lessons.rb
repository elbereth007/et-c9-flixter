# firehose track 4, lesson 18 - file created 17 jun 17 for lessons

class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :subtitle
      t.integer :section_id
      t.timestamps
    end
    add_index :lessons, :section_id
  end
end
