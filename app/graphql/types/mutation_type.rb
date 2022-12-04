module Types
  class MutationType < Types::BaseObject
    field :create_project, mutation: Mutations::CreateProject
    field :update_project, mutation: Mutations::UpdateProject
    field :destroy_project, mutation: Mutations::DestroyProject
    field :create_comment, mutation: Mutations::CreateComment
  end
end
