require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user saved successfully" do
    user = User.new(name: 'adasd', email: 'adada', address: 'adasdad')
    assert(user.save, "Saved successfully")
  end
end
