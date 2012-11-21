module Dashboarder
  module Instrument
    def self.get(name)
      Dashboarder.api.get('/v1/instruments', :query => {:name => name})['instruments'].first
    end

    def self.compose!(name, metric_names)
      streams = metric_names.map { |n| { :metric => n, :source => '*' } }
      Dashboarder.api.post('/v1/instruments', { :name => name, :streams => streams })
    end
    
    def self.compose(name, metric_names)
      get(name) || compose!(name, metric_names)
    end
  end
end
