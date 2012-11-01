module Dashboarder
  class Api
    def initialize(options={})
      @options = options
      @options[:api_url] = Config.librato_api_url
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
      Excon.new(@options[:api_url], :headers => { 'Authorization' => 'Basic ' + [uri.user.sub('%40', '@') + ':' + uri.password].pack('m').delete(Excon::CR_NL) })
    end
  end
end
