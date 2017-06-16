# firehose track 4, lesson 11 - file created 15 jun 17

class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
end
