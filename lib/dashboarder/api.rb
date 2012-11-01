module Dashboarder
  class Api
    def initialize(options={})
      @options = options
      @options[:api_url] = Config.librato_api_url
    end

    def connection
      @connection ||= connect
    end

    def create_instrument(definition)
      name = definition.first
      metric_names = definition[1..-1]

      streams = metric_names.map { |n| { :metric => n, :source => '*' } }
      post('/v1/instruments', { :name => name, :streams => streams })
    end
    
    def ensure_instrument(definition)
      name = definition.first

      instrument_data = instrument(name)

      unless instrument(name)
        instrument_data = create_instrument(definition)  
      end
      instrument_data
    end

    def create_dashboard(name, instrument_definitions)
      instrument_ids = instrument_definitions.map { |d| ensure_instrument(d)['id'] }
      post('/v1/dashboards', { :name => name, :instruments => instrument_ids })
    end
    
    def ensure_dashboard(name, instrument_definitions)
      dashboard = dashboard(name)
      unless dashboard
        dashboard = create_dashboard(name, instrument_definitions)
      end
      dashboard
    end
    
    def dashboard(name)
      get('/v1/dashboards', :query => {:name => name})['dashboards'].first
    end
    
    def instrument(name)
      get('/v1/instruments', :query => {:name => name})['instruments'].first
    end

    def metric(name)
      get("/v1/metrics/name")
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
