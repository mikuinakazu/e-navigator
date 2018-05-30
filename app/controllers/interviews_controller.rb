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
    @user = User.find(current_user.id)
    @interview = Interview.find(params[:id])
  end

  def update
    interview = Interview.find(params[:id])
    if interview.user_id == current_user.id
      interview.update(interview_params)
    else
      redirect_to interviews_path, alert: '変更できるのは、ご自身で登録した面接のみです。'
    end
  end

  def destroy
    interview = Interview.find(params[:id])
    if interview.user_id == current_user.id
      interview.destroy
    else
      redirect_to interviews_path, alert: '削除できるのは、ご自身で登録した面接のみです。'
    end
  end

  private
    def interview_params
      params.require(:interview).permit(:interview_date, :status).merge(user_id: current_user.id)
    end
end
