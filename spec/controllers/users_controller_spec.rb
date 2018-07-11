require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = User.create(name: 'Abhi', email: 'abhinav@sapaad.com', address: 'my address')
  end

  context 'Get index action' do
    it 'should get index page' do
      get :index
      expect(response).to render_template("index")
    end
  end

  context 'Get new action' do
    it 'should get new page' do
      get :new
      expect(response).to be_successful
      expect(response).to render_template("new")
    end
  end

  context 'Get create action' do
    it 'should create a new user' do
      c = User.count
      post :create, params: { user: { name: 'Abhi', email: 'abhinav@sapaad.com', address: 'Aluva' } }
      expect(User.count-c).to eq(1)
      expect(response).to redirect_to(user_path(User.last))
    end
  end

  context 'Get edit action' do
    it 'should get edit page' do
      get :edit, params: { id: @user.id }
      expect(response).to be_successful
      expect(response).to render_template("edit")
    end
  end

  context 'Get update action' do
    it 'should update existing user' do
      user = User.last.name
      post :update, params: { id: @user.id, user: { name: 'New Abhi', email: 'abhinav@sapaad.com', address: 'Aluva' } }
      expect(User.last.name).to_not eq(user)
      expect(User.last.name).to eq('New Abhi')
      expect(response).to redirect_to(user_path(@user))
    end
  end

  context 'Get show action' do
    it 'should get show page' do
      get :show, params: { id: @user.id }
      expect(response).to be_successful
      expect(response).to render_template("show")
    end
  end

  context 'Get delete action' do
    it 'should delete a user' do
      c = User.count
      post :destroy, params: { id: @user.id }
      expect(User.count-c).to eq(-1)
      expect(response).to redirect_to(users_path)
    end
  end

end