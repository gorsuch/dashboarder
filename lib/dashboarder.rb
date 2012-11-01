require 'excon'
require 'json'

require 'dashboarder/api'
require 'dashboarder/config'
require 'dashboarder/version'

module Dashboarder
  def self.api
    @api ||= @api ||= Api.new
  end
end
