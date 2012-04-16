# Devise::BrowserId

Authenticate your Warden/Devise-enabled Rails app using BrowserID from Mozilla

## Installation

Add this line to your application's Gemfile:

    gem 'devise-browserid'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install devise-browserid

## Usage

devise-browserid depends on warden-browserid and is enabled in the Rails
asset pipeline.

I use the devise-browserid strategy with warden, configured like this in
config/initializers/devise.rb in Rails:

```ruby
  config.warden do |manager|
    manager.default_strategies(:scope => :user).unshift :browserid
    # [Mozilla] [1] says to use BrowserID as follows:
    # manager.browserid_url = "dev.diresworb.org"  # Development
(default)
    # manager.browserid_url = "diresworb.org"      # Beta
    # manager.browserid_url = "browserid.org"      # Production
  end
```

Then you add the javascripts at the bottom of your application layout:
```erb
    <%= browserid_include_tag %>
```

And the login button wherever you want to:
```erb
<%= browserid_login_tag %>
```

[1]: https://developer.mozilla.org/en/BrowserID/Primary/Developer_tips
"Mozilla BrowserID Developer Tips"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
