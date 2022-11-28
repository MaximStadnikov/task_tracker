module Types
  class MutationType < Types::BaseObject
    field :create_project, mutation: Mutations::CreateProject
    field :update_comment, mutation: Mutations::UpdateComment
  end
end
