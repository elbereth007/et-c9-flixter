# firehose track 4, lesson 17 - file created 16 jun 17 for instructor sections

class Instructor::SectionsController < ApplicationController
# next 2 lines added 21 jun 17
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course, only: [:new, :create]
  before_action :require_authorized_for_current_section, only: [:update] # added 6 jul 17 for syncing section updates (lesson/challenge 32)
  
  def new
#    @course = Course.find(params[:course_id])  # modified 21 jun 17
    @section = Section.new
  end
  
  def create        # modified 21 jun 17
#    @course = Course.find(params[:course_id])
    @section = current_course.sections.create(section_params)
    redirect_to instructor_course_path(current_course)
  end
  
# next 4 lines added 6 jul 17 for syncing section updates (lesson/challenge 32)
  def update
    current_course.sections.update_attributes(section_params)
    render plain: 'updated!'
  end

  private
  
# next 9 lines added 21 jun 17
  def require_authorized_for_current_course
    if current_course.user != current_user
      render plain: "Unauthorized", status: :unauthorized
    end
  end
  
# next 5 lines added 6 jul 17 for syncing section updates (lesson/challenge 32) (but is this needed?)
  def require_authorized_for_current_section
    if current_section.course.user != current_user
      render plain: "Unauthorized", status: :unauthorized
    end
  end
  
  helper_method :current_course
  
  def current_course
#    @current_course ||= Course.find(params[:course_id])  # commented out/next 5 lines added 6 jul 17 for section syncing (lesson/challenge 32)
    if params[:course_id]
      @current_course ||= Course.find(params[:course_id])
    else
      current_section.course
    end
  end

# next 4 lines added 6 jul 17 for section syncing (lesson/challenge 32)  
  helper_method :current_section
  
  def current_section
    @current_section ||= Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:title, :row_order_position)  # :row_order_position added 6 jul 17 for syncing section updates (lesson/challenge 32)
  end
  
end
