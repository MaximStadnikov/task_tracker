module Projects
  class Update
    class Execute
        include Interactor
        
        delegate :project_params, :project, to: :context

        def call
            contex.fail(error: "Something went whrong while updating") unless project.update(project_params) 
        end

    end  
  end
end