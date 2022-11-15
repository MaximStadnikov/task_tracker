module Projects
  class Destroy
    class Execute
        include Interactor

        delegate :project, to: :context

        def call
            context.fail(error: "project was not deleted") unless project.destroy
        end

    end
  end
end