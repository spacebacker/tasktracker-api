# frozen_string_literal: true

module Types
  class AssigneeType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :email, String, null: false
  end
end
