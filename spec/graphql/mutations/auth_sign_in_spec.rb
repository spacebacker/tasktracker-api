require 'rails_helper'
require 'json_web_token'

module Mutations
  RSpec.describe AuthSignIn, type: :request do
    describe '.resolve' do
      context 'when credentials are correct' do
        it 'authenticate user returning user data' do
          
          user = FactoryBot.create(:user)
          sign_in_data_email = auth_sign_in(email: user.email, password: user.password)
            .dig(:data, :authSignIn, :email)

          expect(sign_in_data_email).to eq user.email
        end
      end

      context 'when credentials are incorrect' do
        it 'returns an error' do
          sign_in_data = auth_sign_in(email: 'incorrect', password: 'incorrect')
          
          expect(sign_in_data.dig(:errors)).not_to be_blank
          expect(sign_in_data.dig(:data, :authSignIn)).to be_nil
        end
      end

      private

      def auth_sign_in(email:, password:)
        gql query: <<~GQL
          mutation { 
            authSignIn(
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
