require 'rails_helper'

RSpec.describe "Users", type: :request do
  
  before(:each) do
    @user = User.create(name: "my name", email: "email@email.com", address: "address")
  end

  context "GET /users" do
    it "get the users page" do
      get users_path
      expect(response).to render_template(:index)
      expect(response.body).to include("Users")
    end
  end

  context "Create new User" do
    it "creates a User and redirects to the user page" do
      get "/users/new"
      expect(response).to be_successful
      expect(response).to render_template(:new)
      post "/users", params: { user: {name: "My user", email: "email@email.com", address: "my address"} }
      follow_redirect!
      expect(response).to be_successful
      expect(response).to render_template(:show)
    end
  end

  context "GET the user details" do
    it "get the user details" do
      get user_path(@user)
      expect(response).to render_template(:show)
      expect(response.body).to include("my name")
    end
  end

  context "Edit User" do
    it "edits a User and redirects to the users page" do
      get edit_user_path(@user)
      expect(response).to be_successful
      expect(response).to render_template(:edit)
      patch "/users/#{@user.id}", params: { user: {name: "My user", email: "email@email.com", address: "my address"} }
      follow_redirect!
      expect(response).to be_successful
      expect(response).to render_template(:show)
    end
  end

  context "Deletes the user" do
    it "deletes the user" do
      get user_path(@user)
      user = @user.name
      delete "/users/#{@user.id}"
      follow_redirect!
      expect(response).to render_template(:index)
      expect(response.body).not_to include("#{user}")
    end
  end

end
