# firehose track 4, lesson/challenge 32 - file created 5 jul 17 for reordering sections

class AlterSectionsAddRowOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :sections, :row_order, :integer
    add_index :sections, :row_order
  end
end
