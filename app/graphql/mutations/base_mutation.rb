module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    def current_user
      context[:current_user]
    end

    def graphql_error(obj)
      if obj.respond_to?(:errors)
        GraphQL::ExecutionError.new(obj.errors.full_messages.join(', '))
      else
        GraphQL::ExecutionError.new(obj)
      end
    end
  end
end
