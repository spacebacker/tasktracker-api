# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :task_create, mutation: Mutations::TaskCreate
    field :task_update, mutation: Mutations::TaskUpdate
    field :task_delete, mutation: Mutations::TaskDelete
    field :project_create, mutation: Mutations::ProjectCreate
    field :project_delete, mutation: Mutations::ProjectDelete
    field :auth_sign_up, mutation: Mutations::AuthSignUp
    field :auth_log_in, mutation: Mutations::AuthLogIn
    field :auth_log_out, mutation: Mutations::AuthLogOut
  end
end
