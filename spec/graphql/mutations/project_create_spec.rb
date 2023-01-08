require 'rails_helper'

module Mutations
  RSpec.describe ProjectCreate, type: :request do
    describe '.resolve' do
      it 'creates and returning a project' do
        
        name = FactoryBot.attributes_for(:project).dig(:name)
        expect(project_create(name:).dig(:name)).to eq name
      end

      private

      def project_create(name:)
        token = JsonWebToken.encode(
          payload: { user_id: FactoryBot.create(:user).id }
        )
        
        query = <<~GQL
          mutation { 
            projectCreate(
              name: "#{name}"
            ) { 
              name
            } 
          }
        GQL

        gql(query:, token:).dig(:data, :projectCreate)
      end
    end
  end
end
