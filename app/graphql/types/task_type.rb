# frozen_string_literal: true

module Types
  class TaskType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :status, String, null: false
    field :description, String
    field :project, Types::ProjectType, null: false
    field :assignee, Types::UserType, null: false
    field :creator, Types::UserType, null: false
  end
end
