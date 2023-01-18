# frozen_string_literal: true

module Mutations
  class TaskCreate < BaseMutation
    description "Creates a new task"

    type Types::TaskType
    argument :task_data, Types::TaskInputType, required: true

    def resolve(task_data:)
      task = Task.new(**task_data, creator: current_user)
      task.save ? task : graphql_error(task)
    end
  end
end
