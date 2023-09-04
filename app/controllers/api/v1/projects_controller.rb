module Api
  module V1
    class ProjectsController < Api::ApplicationController
      before_action :set_project, only: %i[update destroy]
      # authenticate
      before_action :authenticate_user!, only: %i[update destroy create]

      def index
        @projects = Project.all
                           .order(params[:sort])
                           .page(params[:page])
                           .per(5)

        render json: { projects: @projects }
      end

      def create
        @project = create_project.project
        if create_project.success?
          render json: { project: @project, errors: @project.errors }
        else
          render json: { project: {}, errors: @project.errors }
        end
      end

      def update
        if update_project.success?
          render json: { project: @project, errors: @project.errors }
        else
          render json: { project: {}, errors: @project.errors }
        end
      end

      def destroy
        if destroy_project.success?
          render json: { project: @project, msg: "The project has been deleted" }
        else
          render json: { project: {}, msg: "Something went wrong" }
        end
      end

      private

      def create_project
        @create_project ||=
          Projects::Create.call(project_params: project_params, user: current_user)
      end

      def update_project
        @update_project ||=
          Projects::Update.call(project_params: project_params, project: @project)
      end

      def destroy_project
        @destroy_project ||=
          Projects::Destroy.call(project: @project)
      end

      # Only allow a list of trusted parameters through.
      def project_params
        params.require(:project).permit(:name, :description)
      end

      def set_project
        @project = Project.find(params[:id])
      end
    end
  end
end
