# frozen_string_literal: true

module Mutations
  class AuthLogOut < BaseMutation
    description "Sign out current user"
    field :status, String, null: false

    def resolve
      context[:session][:token] = nil
      { status: 'ok' }
    end
  end
end

