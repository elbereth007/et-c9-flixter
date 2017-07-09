# firehose track 4, lesson 13 - file created 16 jun 17 for creating instructor courses

class Instructor::CoursesController < ApplicationController
  before_action :authenticate_user!
  
  # next line added 21 jun 17
  before_action :require_authorized_for_current_course, only: [:show]
  
  def new
    @course = Course.new
  end
  
  def create
    @course = current_user.courses.create(course_params)
    if @course.valid?
      redirect_to instructor_course_path(@course)
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
#    @course = Course.find(params[:id])
# next line added 7 jul 17 for new section form modal (lesson 35)
    @section = Section.new
# next line added 8 jul 17 for new lesson form modal (lesson 36)
     @lesson = Lesson.new
  end


  private
  
# next 9 lines added 21 jun 17
def require_authorized_for_current_course
    if current_course.user != current_user
      render plain: "Unauthorized", status: :unauthorized
    end
  end
  
  helper_method :current_course
  
  def current_course
    @current_course ||= Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :cost, :image)
  end
  
end
