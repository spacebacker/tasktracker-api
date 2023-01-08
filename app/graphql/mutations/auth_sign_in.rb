# frozen_string_literal: true

module Mutations
  class AuthSignIn < BaseMutation
    description "Creates a new user"

    field :user, Types::UserType, null: false
    field :token, String, null: false

    argument :email, String
    argument :password, String

    def resolve(email:, password:)
      user = User.find_by(email:)&.authenticate(password)

      if user
        { token: JsonWebToken.encode(payload: { user_id: user.id }), user: }
      else
        graphql_error('User not found or password is incorrect.')
      end
    end
  end
end
