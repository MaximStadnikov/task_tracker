class CommentsController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :set_comment, only: %i[edit destroy update]
  before_action -> { authorize! @comment }, only: %i[edit destroy update]
  before_action :set_project, only: %i[show edit update destroy]
  before_action :authenticate_current_user!

  def new
    @comment = Comment.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @comment = @task.comments.create(comment_params)
    @comment.user = current_user 

    authorize! @comment

    if @comment.save
      redirect_to project_task_path(@project, @task), notice: "Comment was successfully created!"
    else
      flash.now[:notice] = "Something went wrong. Try again."
      redirect_to project_task_path(@project, @task)
    end
  end

  def destroy
    @comment = @task.comments.find(params[:id]) 
    @comment.destroy

    redirect_to project_task_url(@task.project, @task), notice: "Comment was successfully destroyed."
  end

  def edit
  end

  def update

    if @comment.update(comment_params)
      redirect_to project_task_url(@task.project, @task), notice: "Comment was successfully updated."
    else
      flash.now[:notice] = "Something went wrong. Try again."
      render :edit
    end
  end

  private
  
  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :task_id, :user_id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
