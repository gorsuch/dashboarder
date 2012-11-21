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

```bash
$ LIBRATO_EMAIL=me@example.co LIBRATO_KEY=123456 irb -r dashboarder
```

```ruby
  # a simple dashboard definition
  definition = [
    'my dashboard name',
    [:an_instrument_name, :a_metric_name, :another_metric_name],
    [:another_instrument_name, :a_metric_name]
  ]
  
  # this will ensure the dashboard exists
  # will not overwrite if already does
  Dashboarder::Dashboard.compose(definition)

  # compose an individual instrument
  # will not overwrite if already exists
  Dashboarder::Instrument.compose(['my instrument', :first_metric, :second_metric])

  # If an instrument has already been defined, you can compose
  # like so:
  Dashboarder::Dashboard.compose([:my_dashboard, :some_instrument, :some_other_instrument])
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
