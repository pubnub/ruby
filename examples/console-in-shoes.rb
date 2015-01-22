Shoes.setup do
  gem 'pry'
end

require 'pry'

Shoes.app do

  flow do
    para "subscribe key"
    @sub_key_edit = edit_line
  end

  flow do
    para "publish key"
    @sub_key_edit = edit_line
  end

  flow do
    para "secret key"
    @sec_key_edit = edit_line
  end

  flow do
    para "auth key"
    @auth_key_edit = edit_line
  end

  @init_button = button "Initialize PubNub instance"

  binding.pry
end
