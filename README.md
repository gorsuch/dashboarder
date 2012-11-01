# Dashboarder

An experimental library to help in the construction of Librato Metrics dashboards from simple definitions. 

## Installation

Add this line to your application's Gemfile:

    gem 'dashboarder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dashboarder

## Usage

```ruby
  # a simple dashboard definition
  definition = [
    [:an_instrument_name, :a_metric_name, :another_metric_name],
    [:another_instrument_name, :a_metric_name]
  ]
  
  # ensure_dashboard will create the dashboard only if it does not already exist
  Dashboarder.api.ensure_dashboard('my dashboard', definition)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
