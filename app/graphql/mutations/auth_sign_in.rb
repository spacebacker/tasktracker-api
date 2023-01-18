# frozen_string_literal: true

module Mutations
  class AuthSignIn < BaseMutation
    description "Creates a new user"

    type Types::UserType, null: false

    argument :email, String
    argument :password, String

    def resolve(email:, password:)
      user = User.find_by(email:)&.authenticate(password)

      if user
        set_session_token(user)
        user
      else
        graphql_error('User not found or password is incorrect.')
      end
    end
  end
end
