class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id].to_i)
  end

  def new
    @task = Task.new
  end

  # def create
  #   task = Task.new(task_params)
  #   task.save!
  #   redirect_to task_path(task)
  # end

  def create
    task = Task.create(task_params)
    redirect_to task_path(task)
  end

  def edit
    # @task = Task.find(params[:id].to_i)
  end

  def update
    # task = Task.find(params[:id].to_i)
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    # @task = Task.find(params[:id].to_i)
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id].to_i)
  end
end
