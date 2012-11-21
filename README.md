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
  # compose an instrument
  Dashboarder::Instrument.compose(:my_instrument, [:my_metric, :my_other_metric])

  # compose a dashboard
  Dashboarder::Dashboard.compose(:my_dashboard, [:my_instrument, :my_other_instrument])
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
