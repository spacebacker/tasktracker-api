# frozen_string_literal: true

module Mutations
  class AuthSignUp < BaseMutation
    description "Creates a new user"

    field :user, Types::UserType, null: false
    field :token, String, null: false

    argument :name, String, required: false
    argument :email, String
    argument :password, String

    def resolve(email:, password:, name: nil)
      user = User.new(email:, password:, name:)

      if user.save
        { token: JsonWebToken.encode(payload: { user_id: user.id }), user: }
      else
        graphql_error(user)
      end
    end
  end
end
