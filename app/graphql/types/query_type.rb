module Types
  class QueryType < Types::BaseObject
    field :project, resolver: Resolvers::Project
    field :projects, resolver: Resolvers::Projects
    field :task, resolver: Resolvers::Task
    field :tasks, resolver: Resolvers::Tasks
  end
end
