require 'rails_helper'

module Mutations
  RSpec.describe TaskCreate, type: :request do
    describe '.resolve' do
      it 'creates and returning a task' do
        name = Faker::Hipster.sentence(word_count: rand(3..7))
        expect(task_create(name:).dig(:name)).to eq name
      end

      private

      def task_create(name:)
        project = FactoryBot.create(:project)
        token = JsonWebToken.encode(payload: { user_id: project.user_id })
        query = <<~GQL
          mutation { 
            taskCreate(
              projectId: #{project.id},
              name: "#{name}"
            ) { 
              name
            } 
          }
        GQL

        gql(query:, token:).dig(:data, :taskCreate)
      end
    end
  end
end
