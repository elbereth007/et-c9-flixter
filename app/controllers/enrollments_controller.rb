# firehose track 4, lesson 27 - file created 27 jun 17 for student enrollment

class EnrollmentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    current_user.enrollments.create(course: current_course)
    redirect_to course_path(current_course)
  end
  
  private

  def current_course
    @current_course ||= Course.find(params[:course_id])
  end
  
end
