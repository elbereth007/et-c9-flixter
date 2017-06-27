class User < ApplicationRecord
  # relationship added 16 jun 17 for user-courses
  has_many :courses
  
  # relationship added 26 jun 17 for user-enrollments (lesson 27)
  has_many :enrollments
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
