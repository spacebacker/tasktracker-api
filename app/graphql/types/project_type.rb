# frozen_string_literal: true

module Types
  class ProjectType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :description, String
    field :user, Types::UserType, null: false
    field :tasks, Types::TaskType.connection_type

    def user
      dataloader.with(::Sources::ActiveRecord, ::User).load(object.user_id)
    end
  end
end
