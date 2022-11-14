class CommentsController < ApplicationController
  before_action :authenticate_current_user!
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_task
  before_action :set_project
  before_action -> { authorize! @comment }, only: %i[edit update destroy]

  def create
    @comment = create_comment.comment
    authorize! @comment

    if create_comment.success?
      redirect_to project_task_path(@project, @task), notice: "Comment was successfully created!"
    else
      flash.now[:notice] = "Something went wrong. Try again."
      render "tasks/show"
    end
  end

  def destroy
    destroy_comment
    redirect_to project_task_path(@project, @task), notice: "Comment was successfully destroyed."
  end

  def edit
  end

  def update
    if update_comment.success?
      redirect_to project_task_path(@project, @task),
                  notice: "Comment was successfully updated."
    else
      flash.now[:notice] = "Something went wrong. Try again."
      render :edit
    end
  end

  private

  def create_comment
    @create_comment = Comments::Create.call(comment_params: comment_params.merge({ task: @task, user: current_user }))
  end

  def destroy_comment
    @destroy_comment = Comments::Destroy.call(comment: @comment)
  end

  def update_comment
    @update_comment = Comments::Update.call(comment_params: comment_params, comment: @comment)
  end

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
