# firehose track 4, lesson 30 - file created 28 jun 17 for reordering lessons

class AlterLessonsAddRowOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :row_order, :integer
    add_index :lessons, :row_order
  end
end
