module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :project, resolver: Resolvers::Project
    field :projects, resolver: Resolvers::Projects
    field :task, resolver: Resolvers::Task
    field :tasks, resolver: Resolvers::Tasks
  end
end
