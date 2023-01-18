if !ENV['REDIS_URL'] || Rails.env.test?
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
end

Rack::Attack.throttle('req/ip', limit: 120, period: 2.minutes) do |request|
  request.ip
end