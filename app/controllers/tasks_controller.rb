class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end
  
  def active
    @tasks = Task.where('done', false)
    render 'index'
  end
  
  def completed
    @tasks = Task.where('done', true)
    render 'index'
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      redirect_to tasks_url
    else
      flash['error'] = 'Falha ao salvar'
      render 'new'
    end
  end
  
  private 
  
  def task_params
    params.require(:task).permit(:decription)
  end
end
