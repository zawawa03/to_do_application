class TasksController < ApplicationController
  
  def index
    @tasks = current_user.tasks.includes(:user)
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to tasks_path, success: t('tasks.create.success')
    else
      flash.now[:danger] = t('tasks.create.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to task_path, success: t('tasks.edit.success')
    else
      flash.now[:danger] = t('tasks.edit.failure')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy!
    redirect_to tasks_path, success: t('tasks.destroy.success')
  end

  private

  def task_params
    params.require(:task).permit(:name, :body, :start_time, :state)
  end
end
