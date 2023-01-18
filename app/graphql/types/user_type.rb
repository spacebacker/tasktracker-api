# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :projects, Types::ProjectType.connection_type, null: false
    field :assigned_tasks, Types::TaskType.connection_type, null: false
  end
end
