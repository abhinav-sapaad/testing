require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures name exists' do
      user = User.new(email: 'abhinav@sapaad.com', address: 'my address')
      expect(user.save).to eq(false)
    end

    it 'ensures email exists' do
      user = User.new(name: 'Abhi', address: 'my address')
      expect(user.save).to eq(false)
    end

    it 'ensures address exists' do
      user = User.new(name: 'Abhi', email: '')
      expect(user.save).to eq(false)
    end
    

    it 'ensures user saved successfully' do
      user = User.new(name: 'Abhi', email: 'abhinav@sapaad.com', address: 'my address')
      expect(user.save).to eq(true)
    end
  
  end

  end
