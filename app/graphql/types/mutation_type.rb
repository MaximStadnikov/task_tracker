module Types
  class MutationType < Types::BaseObject
    field :create_project, mutation: Mutations::CreateProject
    field :destroy_comment, mutation: Mutations::DestroyComment
    field :create_comment, mutation: Mutations::CreateComment
  end
end
