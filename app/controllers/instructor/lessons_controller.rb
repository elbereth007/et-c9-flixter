# firehose track 4, lesson 18 - file created 17 jun 17 for lessons

class Instructor::LessonsController < ApplicationController
  before_action :authenticate_user!       # user must be logged in to access lessons
  before_action :require_authorized_for_current_section
  
  def new
#    @section = Section.find(params[:section_id])
# next line added 21 jun 17
#    @section = current_section

# next 3 lines added 21 jun 17
#    if current_section.course.user != current_user     # course creator must be current logged-in user to create new lesson
#      return render plain: 'Unauthorized', status: :unauthorized
#    end
    
    @lesson = Lesson.new
  end
  
  def create
#    @section = Section.find(params[:section_id])
# next line added 21 jun 17
#    @section = current_section
    
# next 3 lines added 21 jun 17
#    if current_section.course.user != current_user   # course creator must be current logged-in user to create new lesson
#      return render plain: 'Unauthorized', status: :unauthorized
#    end
    
#    @lesson = @section.lessons.create(lesson_params)
#    redirect_to instructor_course_path(@section.course)
    @lesson = current_section.lessons.create(lesson_params)
    redirect_to instructor_course_path(current_section.course)
    
  end

  private
  
# next 9 lines added 21 jun 17
  def require_authorized_for_current_section
    if current_section.course.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
  end

  helper_method :current_section
  
  def current_section
    @current_section ||= Section.find(params[:section_id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle)
  end
  
end
