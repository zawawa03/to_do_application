class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  
  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_sessions_path, success: t('users.create.success')
    else
      flash.now[:danger] = t('users.create.failure')
      render :new, status: :unprocessable_entity
    end
  end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
