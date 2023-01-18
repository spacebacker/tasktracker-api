# frozen_string_literal: true

module Types
  class TaskInputType < Types::BaseInputObject
    argument :name, String, required: false
    argument :project_id, ID, required: false
    argument :assignee_id, ID, required: false
    argument :description, String, required: false
  end    
end
