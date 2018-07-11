require 'rails_helper'

RSpec.describe 'users/show.html.erb' do
  it 'displays user details correctly' do
    assign(:user, User.new(name: 'User', email: 'user@user.com', address: 'address'))

    render

    expect(rendered).to have_selector("h1", text: 'User')
    expect(rendered).to include("address")
    expect(rendered).to include("user@user.com")
  end
end