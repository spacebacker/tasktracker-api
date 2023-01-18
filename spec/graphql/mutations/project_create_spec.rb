require 'rails_helper'

module Mutations
  RSpec.describe ProjectCreate do
    it 'creates and returning a project' do
      
      name = FactoryBot.attributes_for(:project).dig(:name)
      expect(project_create(name:).dig(:name)).to eq name
    end

    private

    def project_create(name:)
      current_user = FactoryBot.create(:user)

      query = <<~GQL
        mutation { 
          projectCreate(
            name: "#{name}"
          ) { 
            name
          } 
        }
      GQL

      execute(query:, current_user:).dig(:data, :projectCreate)
    end
  end
end
