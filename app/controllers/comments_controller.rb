class CommentsController < ApplicationController

    before_action :set_task
    before_action :set_project
    before_action ->{authorize! @task}

    def create
        @comment = Comment.new(comment_params.merge({user: current_user, task: @task}))
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
    end

    def destroy
    end

    private

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