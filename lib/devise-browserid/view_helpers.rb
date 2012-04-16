module BrowserId
  module ViewHelpers

    # BrowserID JavaScript tags:
    # - The official BrowserID include.js
    # - The Devise enabled login and assertion reponse
    def browserid_include_tag
      javascript_include_tag(browserid_include_js_url, "browserid")
    end

    # The BrowserID login button
    def browserid_login_tag
      image_tag("sign_in_blue.png", :onclick => "browserIdLogin();")
    end

    # The URL to the BrowserID official JavaScript
    def browserid_include_js_url
      "https://#{ Warden::BrowserId::Strategy.browserid_url }/include." + (::Rails.env == "development" ? "orig.js" : ".js")
    end

  end
end
