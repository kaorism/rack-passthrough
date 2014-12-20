# Rack::Passthrough

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'rack-passthrough'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-passthrough

## Usage

In routes.rb

  # resources :users will be forwarded to 'http://target-path.com' :

  resources :users, to: Rack::Passthrough::Endpoint.new( 'http://target-path.com' )

  # resources :products will be internal processed :

  resources :products


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
