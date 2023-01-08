require 'rails_helper'

module Mutations
  RSpec.describe TaskUpdate, type: :request do
    describe '.resolve' do
      it 'updates task and returning updated task' do
        id = FactoryBot.create(:task).id
        name = Faker::Hipster.sentence(word_count: rand(3..7))
        assignee_id = FactoryBot.create(:user).id.to_s

        task = task_update(id:, name:, assignee_id:)

        expect(task.dig(:name)).to eq name
        expect(task.dig(:assignee, :id)).to eq assignee_id
      end

      private

      def task_update(id:, name:, assignee_id:)
        token = JsonWebToken.encode(payload: { user_id: assignee_id })
        query = <<~GQL
          mutation { 
            taskUpdate(
              id: "#{id}",
              name: "#{name}",
              assigneeId: #{assignee_id}
            ) { 
              name
              assignee {
                id
              }
            } 
          }
        GQL
        
        gql(query:, token:).dig(:data, :taskUpdate)
      end
    end
  end
end
