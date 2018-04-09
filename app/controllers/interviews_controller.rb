class InterviewsController < ApplicationController

  def index
    @user = User.find(current_user.id)
  end

  def new
    @interview = Interview.new
  end

  def create
  end

end
