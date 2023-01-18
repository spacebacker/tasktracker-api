# frozen_string_literal: true

module Mutations
  class AuthSignOut < BaseMutation
    description "Sign out current user"
    field :status, String, null: false

    def resolve
      context[:session][:token] = nil
      { status: 'ok' }
    end
  end
end

