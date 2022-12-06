module Types
  class MutationType < Types::BaseObject
    field :sign_up, mutation: Mutations::SignUp
    field :sign_in, mutation: Mutations::SignIn

    field :create_project, mutation: Mutations::CreateProject
    field :create_comment, mutation: Mutations::CreateComment
    field :update_project, mutation: Mutations::UpdateProject
  end
end
