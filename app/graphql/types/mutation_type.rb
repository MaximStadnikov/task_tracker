module Types
  class MutationType < Types::BaseObject
    field :sign_up, mutation: Mutations::SignUp
    field :sign_in, mutation: Mutations::SignIn

    field :create_project, mutation: Mutations::CreateProject
    field :update_project, mutation: Mutations::UpdateProject
    field :update_task, mutation: Mutations::UpdateTask
    field :destroy_comment , mutation: Mutations::DestroyComment
  end
end
