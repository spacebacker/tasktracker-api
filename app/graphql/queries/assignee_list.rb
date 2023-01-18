# frozen_string_literal: true

module Queries
  class AssigneeList < Queries::BaseQuery
    description "Returns a list of Assignees"
    type Types::AssigneeType.connection_type, null: true

    def resolve
      User.order(:name)
    end
  end
end