# firehose track 4, lesson 21 - file created 21 jun 17 for lesson show page

class LessonsController < ApplicationController
  # next 3 lines added 28 jun 17 for lesson 28 (challenge)
  before_action :authenticate_user!       # user must be logged in to access lessons
  before_action :require_authorized_for_current_lesson, only: [:show]   # user must be enrolled in course to view lesson
#  before_action :require_authorized_for_current_course, only: [:show]
  
  def show
    
  end
  
  private
  
  # next 5 lines added 28 jun 17 for requiring user to be enrolled in course to see lessons - lesson 28 (challenge)
  def require_authorized_for_current_lesson
    if !current_user.enrolled_in?(current_lesson.section.course) && current_lesson.section.course.user != current_user
      redirect_to courses_path, alert: "Please enroll in the course to view lessons"
    end
  end
  
  helper_method :current_lesson
  
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
  
end
