# firehosetrack 4, lesson 27 - file created 26 jun 17 for student enrollment

class CreateEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrollments do |t|
      
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
    
    add_index :enrollments, [:user_id, :course_id]
    add_index :enrollments, :course_id
    
  end
end
