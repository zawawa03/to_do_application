class Admin::UsersController < Admin::BaseController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path, success: 'ステータスの更新に成功しました'
    else
      flash.now[:danger] = 'ステータスの更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to admin_users_path, success: 'ユーザーの削除に成功しました'
  end
  
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :role, :avatar)
  end
end
