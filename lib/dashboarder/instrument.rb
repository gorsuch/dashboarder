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
      # if we passed an atom, attempt to fetch rather than build
      if definition.kind_of?(String) || definition.kind_of?(Symbol)
        instrument = get(definition)
        raise "instrument #{definition} has not been created yet" unless instrument
        instrument
      else
        name = definition.first
        instrument = get(name)

        unless instrument
          instrument = compose!(definition)  
        end
        instrument
     end
    end
  end
end
