# firehose track 4, lesson 18 - file created 17 jun 17 for lessons

class Instructor::LessonsController < ApplicationController
  before_action :authenticate_user!       # user must be logged in to access lessons
  before_action :require_authorized_for_current_section, only: [:new, :create]
  before_action :require_authorized_for_current_lesson, only: [:update]
  
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
  
# next 4 lines added 4 jul 17 for syncing lesson updates (lesson 31)
  def update
    current_lesson.update_attributes(lesson_params)
    render plain: 'updated!'
  end

  private
  
# next 8 lines added 4 jul 17 for syncing lesson updates (lesson 31)
  def require_authorized_for_current_lesson
    if current_lesson.section.course.user != current_user
      render plain: 'Unauthorized', status: :unauthorized
    end
  end
  
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
  
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
    params.require(:lesson).permit(:title, :subtitle, :video, :row_order_position)
  end
  
end
