module Dashboarder
  module Metric
    def self.get(name)
      Dashboard.api.get("/v1/metrics/name")
    end
  end
end
