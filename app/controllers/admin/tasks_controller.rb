class Admin::TasksController < Admin::BaseController
  
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to admin_task_path, success: 'タスクの更新に成功しました'
    else
      flash.now[:danger] = 'タスクの更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy!
    redirect_to admin_task_path, success: 'タスクの削除に成功しました'
  end

  private

  def task_params
    params.require(:task).permit(:name, :body, :limit_date, :state)
  end
end
