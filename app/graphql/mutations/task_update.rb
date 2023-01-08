# frozen_string_literal: true

module Mutations
  class TaskUpdate < BaseMutation
    description "Updates a task"

    type Types::TaskType

    argument :id, ID
    argument :name, String, required: false
    argument :assignee_id, Integer, required: false

    def resolve(id:, name:, assignee_id:)
      task = Task.find_by(id:)
      return graphql_error('Task not found') unless task 

      task.update(name:, assignee_id:) ? task : graphql_error(task)
    end
  end
end
