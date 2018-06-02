class InterviewsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    if @user.profile == nil
      redirect_to new_profile_path, alert: '面接を登録するにはプロフィールの登録が必要です'
    end
    @interviews = @user.interviews

    # 部分テンプレート用
    @today = DateTime.now.strftime("%Y年 %m月 %d日, ")
    @time = DateTime.now.strftime("%H : %M")

    def rand_date
      days = DateTime.tomorrow + 10 - DateTime.tomorrow + 1
      return DateTime.tomorrow + rand(days)
    end
    @random_days = rand_date.strftime("%Y年 %m月 %d日, ")

    def rand_time
      hour = rand(10..20).to_s
      minute = rand(00..59).to_s
      return hour + " : " + minute
    end
    @random_time = rand_time

  end

  def new
    @user = User.find(params[:user_id])
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
