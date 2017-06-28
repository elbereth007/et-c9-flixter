class User < ApplicationRecord
  # relationship added 16 jun 17 for user-courses
  has_many :courses
  
  # relationship added 26 jun 17 for user-enrollments (lesson 27)
  has_many :enrollments
  
  # relationship added 27 jun 17 for user-enrollments (lesson 27)
  has_many :enrolled_courses, through: :enrollments, source: :course
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # next 11 lines added/modified 27 jun 17 for checking if a student is enrolled in a particuoar course (lesson 27)
  def enrolled_in?(course)
#    enrolled_courses = []
#    enrollments.each do |enrollment|
#      enrolled_courses << enrollment.course
#    end

#     enrolled_courses = enrollments.collect do |enrollment|   # does exactly same thing as 4 lines above, but more efficiently
#        enrollment.course
#    end

#    enrolled_courses = enrollments.collect(&:course)      # does exactly same thing as both code blocks above, but more efficiently
    return enrolled_courses.include?(course)
  end
  
end
