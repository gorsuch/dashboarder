# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dashboarder/version'

Gem::Specification.new do |gem|
  gem.name          = "dashboarder"
  gem.version       = Dashboarder::VERSION
  gem.authors       = ["Michael Gorsuch"]
  gem.email         = ["michael.gorsuch@gmail.com"]
  gem.description   = %q{a lightweight composer for librato instruments and dashboards}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/gorsuch/dashboarder"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency('json')
  gem.add_dependency('excon')
end
