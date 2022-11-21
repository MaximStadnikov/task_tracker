module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :content, String
    field :task_id, Integer, null: false
    field :task, TaskType, null: false
    field :user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
