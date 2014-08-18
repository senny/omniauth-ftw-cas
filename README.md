# OmniAuth::Ftw::Cas

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-ftw-cas'
```

And then execute:

    $ bundle

## Usage

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :ftw_cas
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/omniauth-ftw-cas/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
