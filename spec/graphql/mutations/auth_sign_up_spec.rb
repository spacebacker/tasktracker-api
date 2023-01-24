require 'rails_helper'
require 'json_web_token'

module Mutations
  RSpec.describe AuthSignUp, type: :request do
    describe '.resolve' do
      it 'creates a user, returning user data' do
        params = FactoryBot.attributes_for(:user)
        sign_up_data_email = auth_sign_up(**params).dig(:data, :authSignUp, :email)
                
        expect(sign_up_data_email).to eq params[:email]
      end

      context 'when email is already exist' do
        it 'returns an error' do
          params = FactoryBot.attributes_for(:user)
          
          user = FactoryBot.create(:user, **params)
          sign_up_data = auth_sign_up(**params)

          expect(sign_up_data.dig(:errors)).not_to be_blank
          expect(sign_up_data.dig(:data, :authSignUp)).to be_nil
        end
      end

      private

      def auth_sign_up(name:, email:, password:)
        gql query: <<~GQL
          mutation { 
            authSignUp(
              name: "#{name}", 
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
