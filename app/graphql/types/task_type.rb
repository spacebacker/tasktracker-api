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

    def project
      dataloader.with(::Sources::ActiveRecord, ::Project).load(object.project_id)
    end
    def assignee
      dataloader.with(::Sources::ActiveRecord, ::User).load(object.assignee_id)
    end
    def creator
      dataloader.with(::Sources::ActiveRecord, ::User).load(object.creator_id)
    end
  end
end
