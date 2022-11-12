module Comments
  class Update
    include Interactor
    
    delegate :comment_params, :comment, to: :context
    
    def call
        context.fail!(error: "comment not updated") unless update_comment
    end

    private 

    def update_comment
        comment.update(comment_params)
    end

  end
end