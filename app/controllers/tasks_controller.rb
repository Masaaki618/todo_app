class TasksController < ApplicationController
  def index
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_url, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
  end

  def show
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_url, notice: "タスク 「#{@task.name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
