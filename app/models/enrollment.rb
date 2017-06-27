# firehose track 4, lesson 27 - file created 26 jun 17 for student enrollment

class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :user
end
