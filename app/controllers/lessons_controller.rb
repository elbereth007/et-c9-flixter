# firehose track 4, lesson 21 - file created 21 jun 17 for lesson show page

class LessonsController < ApplicationController
  
  def show
    
  end
  
  private
  
  helper_method :current_lesson
  
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
  
end
