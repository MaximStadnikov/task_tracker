class CommentsController < ApplicationController
  before_action :set_project, only: %i[index new create edit update destroy] 
  before_action :set_task, only: %i[index show edit destroy new create update] 
  before_action :set_comment, only: %i[show show edit update destroy]

  def index
    @comments = @task.comments
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params.merge(user_id: current_user.id, task_id: @task.id))

    if @comment.save 
      redirect_to project_task_comments_path(@project, @task)
    end

  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to [@project, @task, @comment]
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = "Your comment has been deleted"
    redirect_to project_task_comments_path(@project, @task)
  end

  private 

  def set_comment
    @comment = Comment.find(params[:id]) 
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
