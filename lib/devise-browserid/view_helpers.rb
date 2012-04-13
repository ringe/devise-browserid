module BrowserId
  module ViewHelpers
    def browserid_include_tag
      raw %{<script src="https://#{ request.env['warden'].config.browserid_url }/include.js" type="text/javascript"></script>}
    end

    def browserid_login_tag
      image_tag("sign_in_blue.png", :onclick => "browserIdLogin();")
    end
  end
end
