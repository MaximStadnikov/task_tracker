module Types
  class MutationType < Types::BaseObject
    field :create_project, mutation: Mutations::CreateProject
    field :create_task, mutation: Mutations::CreateTask
    field :update_user, mutation: Mutations::UpdateUser
  end
end
