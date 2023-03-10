# frozen_string_literal: true

module JsonWebToken
  extend self

  SECRET_KEY_JWT = Rails.application.credentials.secret_key_jwt

  def encode(payload:, expire: 1.year.from_now.to_i)
    JWT.encode({ expire:, **payload }, SECRET_KEY_JWT)
  end

  def decode(token:)
    return {} if token.blank?

    HashWithIndifferentAccess.new(JWT.decode(token, SECRET_KEY_JWT)[0])
  rescue JWT::DecodeError => e
    {}
  end
end