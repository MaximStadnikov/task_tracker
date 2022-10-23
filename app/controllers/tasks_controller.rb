class TasksController < ApplicationController
  before_action :set_project, only: %i[index new show create destroy edit update]
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = @project.tasks
  end

  def new
    @task = @project.tasks.build
  end

  def show
  end 

  def create
    @task = @project.tasks.build(task_params)
    @task.deadline_at = 7.days.after

    if @task.save 
      flash[:notice] = "Task craeted!"
      redirect_to [@project, @task]  
   else
      render :new
   end
  end

  def destroy
    @task.destroy
    redirect_to project_tasks_path(@project), notice: "Project was successfully destroyed."
  end

  def edit
    @task = @project.tasks.find(params[:id])
  end 

  def update
    if @task.update(task_params)
      redirect_to [@project, @task]
    else
      render :edit
    end
  end
  
  private

  def set_project
    @project = Project.find_by!(id: params[:project_id])
  end
  
  def set_task
    @task = Task.find_by!(id: params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :title, :description, :deadline_at)
  end
end
