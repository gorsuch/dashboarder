module Dashboarder
  module Dashboard
    def self.compose!(definition)
      name = definition.first
      instrument_definitions = definition[1..-1]
      instrument_ids = instrument_definitions.map { |d| Instrument.compose(d)['id'] }
      Dashboarder.api.post('/v1/dashboards', { :name => name, :instruments => instrument_ids })
    end
    
    def self.compose(definition)
      dashboard = get(definition.first)
      unless dashboard
        dashboard = compose!(definition)
      end
      dashboard
    end
    
    def self.get(name)
      Dashboarder.api.get('/v1/dashboards', :query => {:name => name})['dashboards'].first
    end
  end
end
