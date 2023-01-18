# frozen_string_literal: true

module Mutations
  class AuthSignUp < BaseMutation
    description "Creates a new user"

    type Types::UserType, null: false

    argument :name, String, required: false
    argument :email, String
    argument :password, String

    def resolve(email:, password:, name: nil)
      user = User.new(email:, password:, name:)

      if user.save
        set_session_token(user)
        user
      else
        graphql_error(user)
      end
    end
  end
end
