class InterviewsController < ApplicationController

  def index
    @user = User.find(current_user.id)
    if @user.profile == nil
      redirect_to new_profile_path, alert: '面接を登録するにはプロフィールの登録が必要です'
    end
    @interviews = @user.interviews
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.create(interview_params)
  end

  def edit
  end

  def update
  end

  def destroy
    interview = Interview.find(params[:id])
    interview.destroy
  end

  private
    def interview_params
      params.require(:interview).permit(:interview_date, :status).merge(user_id: current_user.id)
    end
end
