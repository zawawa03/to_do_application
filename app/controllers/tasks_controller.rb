class TasksController < ApplicationController
  
  def index
    @tasks = Task.includes(:user)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to tasks_path, success: 'タスクの登録に成功しました'
    else
      flash.now[:danger] = 'タスクの登録に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to task_path, success: 'タスクの更新に成功しました'
    else
      flash.now[:danger] = 'タスクの更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy!
    redirect_to tasks_path, success: 'タスクの削除に成功しました'
  end

  private

  def task_params
    params.require(:task).permit(:name, :body, :limit_date, :state)
  end
end
