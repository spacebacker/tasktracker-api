require 'rails_helper'
require 'json_web_token'

module Mutations
  RSpec.describe AuthLogIn, type: :request do
    describe '.resolve' do
      context 'when credentials are correct' do
        it 'authenticate user returning user data' do
          
          user = FactoryBot.create(:user)
          log_in_data_email = auth_log_in(email: user.email, password: user.password)
            .dig(:data, :authLogIn, :email)

          expect(log_in_data_email).to eq user.email
        end
      end

      context 'when credentials are incorrect' do
        it 'returns an error' do
          log_in_data = auth_log_in(email: 'incorrect', password: 'incorrect')
          
          expect(log_in_data.dig(:errors)).not_to be_blank
          expect(log_in_data.dig(:data, :authLogIn)).to be_nil
        end
      end

      private

      def auth_log_in(email:, password:)
        gql query: <<~GQL
          mutation { 
            authLogIn(
              email: "#{email}", 
              password: "#{password}"
            ) { 
                email 
            } 
          }
        GQL
      end
    end
  end
end
