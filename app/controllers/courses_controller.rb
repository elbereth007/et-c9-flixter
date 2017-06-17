# firehose track 4, lesson 15 - file created 16 jun 17 for courses from student perspective

class CoursesController < ApplicationController
  
  def index
    @courses = Course.all
  end
  
end
