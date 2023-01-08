# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :task_create, mutation: Mutations::TaskCreate
    field :task_update, mutation: Mutations::TaskUpdate
    field :project_create, mutation: Mutations::ProjectCreate
    field :auth_sign_up, mutation: Mutations::AuthSignUp
    field :auth_sign_in, mutation: Mutations::AuthSignIn
  end
end
