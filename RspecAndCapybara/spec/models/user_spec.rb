require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    FactoryGirl.build(:user,
      name: "username",
      password: "password")
  end

  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_length_of(:password).is_at_least(6)}

  it { should have_many(:user_votes)}
  it { should have_many(:subs)}
  it { should have_many(:comments)}

  describe '#is_password?' do
    it 'identifies correct password as correct' do
      expect(user.is_password?('password')).to_be true
    end

    it 'identifies incorrect password as incorrect' do
      expect(user.is_password?('schpassword')).to_be true
    end
  end

  describe '#reset_session_token?' do
    let(:original_session_token) { user.session_token }

    it 'resets the session token' do
      expect(user.session_token).to_not eq(original_session_token)
    end
  end

  describe '#self.find_by_credentials' do
    before { user.save! }
    it 'finds an actual user' do
      expect(user.find_by_credentials('username', 'password')).to eq(user)
    end

    it 'does not find an invalid user' do
      expect(user.find_by_credentials('schusername', 'password')).to eq(nil)
      expect(user.find_by_credentials('username', 'schpassword')).to eq(nil)
    end
  end
end
