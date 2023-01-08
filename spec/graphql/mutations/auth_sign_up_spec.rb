require 'rails_helper'
require 'json_web_token'

module Mutations
  RSpec.describe AuthSignUp, type: :request do
    describe '.resolve' do
      it 'creates a user, returning token and user data' do
        params = FactoryBot.attributes_for(:user)
        sign_up_data = mutation(**params).dig(:data, :authSignUp)
                
        expect(sign_up_data.dig(:token)).not_to be_blank
        expect(sign_up_data.dig(:user, :email)).to eq params[:email]
      end

      context 'when email is already exist' do
        it 'returns an error' do
          user = FactoryBot.create(:user)
          sign_up_data = mutation(email: user.email, password: user.password)

          expect(sign_up_data.dig(:errors)).not_to be_blank
          expect(sign_up_data.dig(:data, :authSignUp)).to be_nil
        end
      end

      private

      def mutation(email:, password:)
        gql query: <<~GQL
          mutation { 
            authSignUp(
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
