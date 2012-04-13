require 'devise-browserid/view_helpers'
module BrowserId
  class Railtie < Rails::Railtie
    initializer "my_gem.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
