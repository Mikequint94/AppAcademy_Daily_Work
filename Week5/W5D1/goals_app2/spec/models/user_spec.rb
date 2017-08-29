require 'rails_helper'

RSpec.describe User, type: :model do

  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password_digest)}
  it {should have_many(:goals)}
  it {should have_many(:comments)}

  subject(:user) { User.create!(username:"mike",password: "123456") }

    describe 'self.find_by_credentials(username,password)' do
      it 'should find and return correct user' do
        User.find_by_credentials("mike", "123456").to eq(user)
      end
    end


end
