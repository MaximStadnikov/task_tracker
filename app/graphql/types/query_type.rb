module Types
  class QueryType < Types::BaseObject
    field :projects, resolver: Resolvers::Projects
  end
end
