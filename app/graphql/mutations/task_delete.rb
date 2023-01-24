# frozen_string_literal: true

module Mutations
  class TaskDelete < BaseMutation
    description "Deletes a task"

    argument :id, ID, required: true
    field :id, ID, null: false

    def resolve(id:)
      task = current_user.created_tasks.find_by(id: id)
      return graphql_error('Task not found') unless task 

      task.destroy ? task : graphql_error(task)
    end
  end
end
