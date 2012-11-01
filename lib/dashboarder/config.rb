module Dashboarder
  module Config
    extend self

    def env!(key)
      ENV[key] || raise("#{key} not found in ENV")
    end

    def librato_api_url
      env!('LIBRATO_API_URL')
    end
  end
end
