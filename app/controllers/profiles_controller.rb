class ProfilesController < ApplicationController
  
  def show; end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    
    if @user.update(update_params)
      redirect_to profile_path, success: t('profiles.update.success')
    else
      flash.now[:danger] = t('profiles.update.failure')
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def update_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar)
  end
end
