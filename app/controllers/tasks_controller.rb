class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end


  def new
    @task = @project.tasks.build
  end

  def show
    @task = @project.tasks.find(params[:id]) 
  end 



    def create
      @project = Project.find(params[:project_id])
      @task = @project.tasks.create(task_params)
      redirect_to [@project, @task]
    end

    def destroy
      
      @task = @project.tasks.find(:id)

      if @task.destroy
        redirect_to project_tasks_path, notice: "Project was successfully destroyed."
      end

    end

    def edit
      @task = @project.tasks.find(params[:id])
    end 

    def update
      if @task.update(task_params)
        redirect_to [@project, @task]
      else
        render "edit"
      end
    end
  
    private

    def task_params
      params.require(:task).premit(:title, :name, :description)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
  
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :title, :description, :deadline_at)
    end
end
