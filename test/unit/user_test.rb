require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "zee truth" do
    user = User.new :user_id => "fEwe5qckZE_sVZAXBffXGA"
    content = user.populate_info
    assert content.class, String
  end
end
