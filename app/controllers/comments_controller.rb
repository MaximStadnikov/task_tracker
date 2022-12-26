class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_task
  before_action :set_project
  before_action -> { authorize! @task }

  def create
    @comment = Comment.new(comment_params.merge({ user: current_user, task: @task }))
    if @comment.save
      flash[:notice] = "Comment created"
      redirect_to project_task_path(@project, @task)
    else
      render "task/show"
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "Comment edited"
      redirect_to project_task_path(@project, @task)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = "comment destroyed"
    redirect_to project_task_path(@project, @task)
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
