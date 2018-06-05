class ProfilesController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @profile = Profile.new
    @user_email = current_user.email
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to edit_profile_path(current_user.id), notice: 'Your profile is successfully saved'
    else
      redirect_to edit_profile_path(current_user.id), notice: 'Unsuccessfully saved'
    end
  end

  def edit
    @profile = Profile.where(user_id: current_user.id).last
    if @profile != nil
      return @profile
    else
      redirect_to new_profile_path
    end
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to edit_profile_path(current_user.id), notice: 'プロフィール更新が完了しました'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :birth_date, :sex, :school).merge(user_id: current_user.id)
  end

end
