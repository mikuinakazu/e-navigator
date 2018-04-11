class InterviewsController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @interviews = @user.interviews
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.create(interview_params)
  end

  private
    def interview_params
      params.require(:interview).permit(:interview_date, :status).merge(user_id: current_user.id)
    end
end
