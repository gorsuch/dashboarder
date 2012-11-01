module Dashboarder
  class Api
    def initialize(options={})
      @options = options
      @options[:api_url] = Config.librato_api_url || 'https://metrics-api.librato.com'
      @options[:api_user] = Config.librato_email
      @options[:api_pass] = Config.librato_key
    end

    def connection
      @connection ||= connect
    end

    def get(path, options = {})
      JSON.load(connection.get(options.merge(:path => path, :idempotent => true)).body)
    end

    def post(path, body, options = {})
      JSON.load(connection.post(options.merge(:path => path, :body => body.to_json, :headers => { 'Content-Type' => 'application/json' })).body)
    end
    
    def connect
      uri = URI.parse(@options[:api_url])
      Excon.new(api_url, :headers => { 'Authorization' => 'Basic ' + [api_user.sub('%40', '@') + ':' + api_pass].pack('m').delete(Excon::CR_NL) })
    end

    def api_url
      @options[:api_url]
    end

    def api_user
      @options[:api_user]
    end

    def api_pass
      @options[:api_pass]
    end
  end
end
