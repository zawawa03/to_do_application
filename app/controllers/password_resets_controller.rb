class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    @user&.deliver_reset_password_instructions!
    redirect_to new_user_sessions_path, success: t('password_resets.send')
  end

  def edit
    @token = params[:id]
    @user =User.load_from_reset_password_token(params[:id])
    return not_authenticated if @user.blank?
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      redirect_to new_user_sessions_path,success: t('password_resets.success')
    else
      flash.now[:danger] = t('password_resets.failure')
      render :edit, status: :unprocessable_entity
    end
  end
end
