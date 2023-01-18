require 'rails_helper'

module Mutations
  RSpec.describe TaskDelete do
    it 'deletes task and returning deleted task id' do
      project = FactoryBot.create(:project)
      
      project_delete_data_id = project_delete(
        id: project.id, 
        current_user: project.user
      )

      expect(project_delete_data_id).to eq project.id
    end

    private

    def project_delete(id:, current_user:)
      query = <<~GQL
        mutation { 
          projectDelete(
            id: "#{id}"
          ) { 
            id
          } 
        }
      GQL
      
      execute(query:, current_user:).dig(:data, :projectDelete, :id).to_i
    end
  end
end
