# firehose track 4, lesson 17 - file created 16 jun 17 for instructor sections

class Instructor::SectionsController < ApplicationController
# next 2 lines added 21 jun 17
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course
  
  def new
#    @course = Course.find(params[:course_id])  # modified 21 jun 17
    @section = Section.new
  end
  
  def create        # modified 21 jun 17
#    @course = Course.find(params[:course_id])
    @section = current_course.sections.create(section_params)
    redirect_to instructor_course_path(current_course)
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
    @current_course ||= Course.find(params[:course_id])
  end

  def section_params
    params.require(:section).permit(:title)
  end
  
end
