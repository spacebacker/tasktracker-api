# frozen_string_literal: true

module Mutations
  class TaskCreate < BaseMutation
    description "Creates a new task"

    type Types::TaskType

    argument :name, String
    argument :project_id, Integer
    argument :assignee_id, Integer, required: false

    def resolve(name:, project_id:, assignee_id: current_user&.id)
      task = Task.new(name:, project_id:, assignee_id:, creator: current_user)
      task.save ? task : graphql_error(task)
    end
  end
end
