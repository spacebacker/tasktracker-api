# frozen_string_literal: true

module Mutations
  class ProjectCreate < BaseMutation
    description "Creates a new project"

    type Types::ProjectType

    argument :name, String
    argument :description, String, required: false

    def resolve(name:, description: nil)
      project = Project.new(name:, description:, user: current_user)
      project.save ? project : graphql_error(project)
    end
  end
end
