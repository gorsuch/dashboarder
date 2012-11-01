module Dashboarder
  module Config
    extend self

    def env!(key)
      ENV[key] || raise("#{key} not found in ENV")
    end

    def librato_api_url
      ENV['LIBRATO_API_URL']
    end

    def librato_key
      env!('LIBRATO_KEY')
    end

    def librato_email
      env!('LIBRATO_EMAIL')
    end
  end
end
