module BrowserId
  module ViewHelpers
    def browserid_include_tag
      javascript_include_tag("https://#{ request.env['warden'].config.browserid_url }/include.js", "browserid")
    end

    def browserid_login_tag
      image_tag("sign_in_blue.png", :onclick => "browserIdLogin();")
    end
  end
end
