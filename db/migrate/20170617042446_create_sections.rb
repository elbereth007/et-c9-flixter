# firehose track 4, lesson 17 - file created 16 jun 17 for sections

class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.string :title
      t.integer :course_id
      t.timestamps
    end
    add_index :sections, :course_id
  end
end
