# frozen_string_literal: true

module Mutations
  class TaskUpdate < BaseMutation
    description "Updates a task"

    type Types::TaskType

    argument :id, ID
    argument :task_data, Types::TaskInputType, required: true

    def resolve(id:, task_data:)
      task = current_user.created_tasks.find_by(id:)
      return graphql_error('Task not found') unless task 

      task.update(**task_data) ? task : graphql_error(task)
    end
  end
end
