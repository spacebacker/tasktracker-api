# frozen_string_literal: true

module Types
  class ProjectType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :description, String
    field :user, Types::UserType, null: false
    field :tasks, Types::TaskType.connection_type
  end
end
