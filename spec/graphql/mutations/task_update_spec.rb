require 'rails_helper'

module Mutations
  RSpec.describe TaskUpdate do
    it 'updates task and returning updated task' do
      task = FactoryBot.create(:task)

      task_data = {
        id: task.id,
        name: Faker::Hipster.sentence(word_count: rand(3..7)),
        assignee_id: FactoryBot.create(:user).id.to_s,
        current_user: task.creator
      }
    
      task_update_data = task_update(**task_data)

      expect(task_update_data.dig(:name)).to eq task_data[:name]
      expect(task_update_data.dig(:assignee, :id)).to eq task_data[:assignee_id]
    end

    private

    def task_update(id:, name:, assignee_id:, current_user:)
      query = <<~GQL
        mutation { 
          taskUpdate(
            id: "#{id}",
            taskData: {
              name: "#{name}",
              assigneeId: #{assignee_id}
            }
          ) { 
            name
            assignee {
              id
            }
          } 
        }
      GQL
      
      execute(query:, current_user:).dig(:data, :taskUpdate)
    end
  end
end
