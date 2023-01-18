module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    def current_user
      context[:current_user]
    end

    def set_session_token(user)
      context[:session][:token] = JsonWebToken.encode(
        payload: { user_id: user.id }
      )
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
