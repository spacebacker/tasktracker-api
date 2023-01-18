require 'rails_helper'

module Queries
  RSpec.describe AssigneeList, type: :request do
    describe '.resolve' do
      it 'returnes list of assignees' do
        user = FactoryBot.create(:user)
        expect(assignee_list).not_to be_empty
      end
    end

    private

    def assignee_list
      query = <<~GQL
        query { 
          assigneeList { 
              nodes {
                id
              }
          } 
        }
      GQL

      gql(query:).dig(:data, :assigneeList, :nodes)
    end
  end
end
