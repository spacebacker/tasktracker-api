# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :email, String
    field :projects, Types::ProjectType.connection_type
    field :tasks, Types::TaskType.connection_type
  end
end
