require 'rails_helper'
require 'json_web_token'

RSpec.describe JsonWebToken, type: :helper do

  let(:payload) { { user_id: 1 } }
  let(:expire) { 1703451752 }
  let(:token) { 'eyJhbGciOiJIUzI1NiJ9.eyJleHBpcmUiOjE3MDM0NTE3NTIsInVzZXJfaWQiOjF9.ONQ18J4xXX1G3EJfOZ7jMifvzUdKwK2ggZz_7whOEH0' }

  describe '#encode' do
    it 'returns JSON Web Token' do
      expect(JsonWebToken.encode(payload:, expire:)).to eq(token)
    end
  end

  describe '#decode' do
    context 'when JSON Web Token is correct' do
      it 'returns hash with data stored in JSON Web Token' do
        expect(JsonWebToken.decode(token:)).to include(payload, expire:)
      end
    end

    context 'when JSON Web Token is incorrect, nil or blank' do
      it 'returns an empty hash' do
        expect(JsonWebToken.decode(token: 'abc')).to be_empty
        expect(JsonWebToken.decode(token: nil)).to be_empty
        expect(JsonWebToken.decode(token: '')).to be_empty
      end
    end
  end
end