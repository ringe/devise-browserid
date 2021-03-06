# Persona is Shutting Down

Mozilla has announced that Persona will be [shutting down](https://wiki.mozilla.org/Identity/Persona_Shutdown_Guidelines_for_Reliers) November 2016. warden-browserid relies on the Persona service and will stop functioning properly once Persona is shut down. While it is possible to self-host Persona and configure warden-browserid to rely on your own instance, this is difficult and not recommended. See the wiki page linked above for recommended alternatives to Persona for authentication.

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

I use the devise-browserid strategy with warden. [Mozilla] [1] says to use
BrowserID as shown. In your Rails config/initializers/devise.rb:

```ruby
  config.warden do |manager|
    manager.default_strategies(:scope => :user).unshift :browserid
    # manager.browserid_url = "dev.diresworb.org"  # Development (default)
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
<% sign_in_path = "/sign_in" %>
<%= browserid_login_tag(sign_in_path) %>
```

[1]: https://developer.mozilla.org/en/BrowserID/Primary/Developer_tips
"Mozilla BrowserID Developer Tips"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
