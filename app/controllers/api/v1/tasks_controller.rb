module Api
  module V1
    class TasksController < Api::ApplicationController
      before_action :set_task, only: %i[update destroy]
      before_action :set_project, only: %i[index create]
      before_action :authenticate_user!, only: %i[create update destroy]

      def index
        @tasks = @project.tasks
        render json: { tasks: @tasks }
      end

      def create
        @task = create_task.task
        if create_task.success?
          render json: { task: @task, error: {} }
        else
          render json: { task: {}, error: "Task creation failed" }
        end
      end

      def update
        if update_task.success?
          render json: { task: @task, error: {} }
        else
          render json: { task: {}, error: "Task update failed" }
        end
      end

      def destroy
        if destroy_task.success?
          render json: { task: @task, errors: {} }
        else
          render json: { task: {}, errors: "Task deletion failed" }
        end
      end

      private

      def task_params
        params.require(:task).permit(:name, :title, :description, :deadline_at)
      end

      def set_task
        @task = Task.find(params[:id])
      end

      def set_project
        @project = Project.find(params[:project_id])
      end

      def create_task
        @create_task ||=
          Tasks::Create.call(task_params: task_params, project: @project)
      end

      def update_task
        @update_task ||=
          Tasks::Update.call(task_params: task_params, task: @task)
      end

      def destroy_task
        @destroy_task ||=
          Tasks::Destroy::Execute.call(task: @task)
      end
    end
  end
end
