module Dashboarder
  module Instrument
    def self.get(name)
      Dashboarder.api.get('/v1/instruments', :query => {:name => name})['instruments'].first
    end

    def self.compose!(definition)
      name = definition.first
      metric_names = definition[1..-1]

      streams = metric_names.map { |n| { :metric => n, :source => '*' } }
      Dashboarder.api.post('/v1/instruments', { :name => name, :streams => streams })
    end
    
    def self.compose(definition)
      name = definition.first
      instrument = get(name)

      unless instrument
        instrument = compose!(definition)  
      end
      instrument
    end
  end
end
