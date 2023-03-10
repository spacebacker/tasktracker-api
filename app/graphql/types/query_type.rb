module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField
    
    field :current_user, resolver: Queries::CurrentUser
    field :assignee_list, resolver: Queries::AssigneeList
  end
end
