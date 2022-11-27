module Types
  class CommentType < BaseObject
    field :id, ID, null: false
    field :content, String, null: false
    field :task, Types::TaskType, null: false
  end
end
