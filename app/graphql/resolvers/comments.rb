module Resolvers
  class Comments < Resolvers::Base
    type [Types::CommentType], null: false

    def resolve(**_options)
      ::Comment.all
    end
  end
end
