# frozen_string_literal: true

module Mutations
  class ProjectCreate < BaseMutation
    description "Creates a new project"

    type Types::ProjectType
    argument :name, String

    def resolve(name:)
      project = Project.new(name:, user: current_user)
      project.save ? project : graphql_error(project)
    end
  end
end
