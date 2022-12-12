module Types
  class MutationType < Types::BaseObject
    field :sign_up, mutation: Mutations::SignUp
    field :sign_in, mutation: Mutations::SignIn

    field :create_project, mutation: Mutations::CreateProject
    field :destroy_comment, mutation: Mutations::DestroyComment
    field :update_project, mutation: Mutations::UpdateProject
  end
end
