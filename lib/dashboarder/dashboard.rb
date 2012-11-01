module Dashboarder
  module Dashboard
    def self.compose!(name, instrument_definitions)
      instrument_ids = instrument_definitions.map { |d| Instrument.compose(d)['id'] }
      Dashboarder.api.post('/v1/dashboards', { :name => name, :instruments => instrument_ids })
    end
    
    def self.compose(name, instrument_definitions)
      dashboard = get(name)
      unless dashboard
        dashboard = compose!(name, instrument_definitions)
      end
      dashboard
    end
    
    def self.get(name)
      Dashboarder.api.get('/v1/dashboards', :query => {:name => name})['dashboards'].first
    end
  end
end
