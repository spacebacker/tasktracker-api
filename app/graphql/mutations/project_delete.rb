# frozen_string_literal: true

module Mutations
  class ProjectDelete < BaseMutation
    description "Deletes a project"

    argument :id, ID, required: true
    field :id, ID, null: false

    def resolve(id:)
      project = current_user.projects.find_by(id: id)
      return graphql_error('Project not found') unless project 

      project.destroy ? project : graphql_error(project)
    end
  end
end
