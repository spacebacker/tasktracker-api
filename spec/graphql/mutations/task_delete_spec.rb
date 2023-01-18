require 'rails_helper'

module Mutations
  RSpec.describe TaskDelete do
    it 'deletes task and returning deleted task id' do
      task = FactoryBot.create(:task)
      task_delete_data_id = task_delete(id: task.id, current_user: task.creator)

      expect(task_delete_data_id).to eq task.id
    end

    private

    def task_delete(id:, current_user:)
      query = <<~GQL
        mutation { 
          taskDelete(
            id: "#{id}"
          ) { 
            id
          } 
        }
      GQL
      
      execute(query:, current_user:).dig(:data, :taskDelete, :id).to_i
    end
  end
end
