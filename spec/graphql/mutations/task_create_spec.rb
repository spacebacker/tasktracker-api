require 'rails_helper'

module Mutations
  RSpec.describe TaskCreate do
    it 'creates and returning a task' do
      name = Faker::Hipster.sentence(word_count: rand(3..7))
      expect(task_create(name:).dig(:name)).to eq name
    end

    private

    def task_create(name:)
      project = FactoryBot.create(:project)
      current_user = FactoryBot.create(:user)
      assignee_id = FactoryBot.create(:user).id

      query = <<~GQL
        mutation { 
        taskCreate(
          taskData: {
            name: "#{name}",
            projectId: #{project.id},
            assigneeId: #{assignee_id}
          }
          ) { 
            name
          } 
        }
      GQL

      execute(query:, current_user:).dig(:data, :taskCreate)
    end
  end
end
