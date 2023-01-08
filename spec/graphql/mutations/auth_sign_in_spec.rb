require 'rails_helper'
require 'json_web_token'

module Mutations
  RSpec.describe AuthSignIn, type: :request do
    describe '.resolve' do
      context 'when credentials are correct' do
        it 'authenticate user returning token and user data' do
          
          user = FactoryBot.create(:user)
          sign_in_data = mutation(email: user.email, password: user.password)
            .dig(:data, :authSignIn)
          
          expect(sign_in_data.dig(:token)).not_to be_blank
          expect(sign_in_data.dig(:user, :email)).to eq user.email
        end
      end

      context 'when credentials are incorrect' do
        it 'returns an error' do
          sign_in_data = mutation(email: 'incorrect', password: 'incorrect')
          
          expect(sign_in_data.dig(:errors)).not_to be_blank
          expect(sign_in_data.dig(:data, :authSignIn)).to be_nil
        end
      end

      private

      def mutation(email:, password:)
        gql query: <<~GQL
          mutation { 
            authSignIn(
              email: "#{email}", 
              password: "#{password}"
            ) { 
              token 
              user { 
                email 
              } 
            } 
          }
        GQL
      end
    end
  end
end
