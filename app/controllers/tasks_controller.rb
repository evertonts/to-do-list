class TasksController < ApplicationController
  respond_to :json

  def home    
  end

  def show
    respond_with Task.find(params[:id])
  end

  def create
    respond_with Task.create(task_params)
  end

  def update
    respond_with Task.update(params[:id], task_params)
  end

  def destroy
    respond_with Task.destroy(params[:id])
  end
  
  def toggle_done
    @task = Task.find(params[:id])
    @task.update(:done => !@task.done?)
    redirect_to tasks_url
  end
  
  def index
    respond_with Task.all
  end
  
  def completed
    respond_with Task.where(done: true)
  end
  
  def active
    respond_with Task.where(done: false)
  end
  
  private 
  
  def task_params
    params.require(:task).permit(:description)
  end
end
