module Dashboarder
  module Dashboard
    def self.create!(name, instrument_names)
      instrument_ids = instrument_names.map do |d|
        i = Instrument.get(d) || raise("Instrument #{name} not defined yet")
        i['id']
      end
      Dashboarder.api.post('/v1/dashboards', { :name => name, :instruments => instrument_ids })
    end
    
    def self.compose(name, instrument_names)
      get(name) || create!(name, instrument_names)
    end
    
    def self.get(name)
      Dashboarder.api.get('/v1/dashboards', :query => {:name => name})['dashboards'].first
    end
  end
end
