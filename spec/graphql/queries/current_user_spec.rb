require 'rails_helper'

module Queries
  RSpec.describe CurrentUser, type: :request do
    describe '.resolve' do
      it 'returnes logged in user' do
        current_user = FactoryBot.create(:user)
        expect(current_user_id(current_user:)).to eq current_user.id
      end
    end
    
    private

    def current_user_id(current_user:)
      query = <<~GQL
        query { 
          currentUser { 
            id
          } 
        }
      GQL

      execute(query:, current_user:).dig(:data, :currentUser, :id).to_i
    end
  end
end
