require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_length_of(:password), is_at_least(6)}
  it { should have_many(:user_votes)}
  it { should have_many(:subs)}
  it { should have_many(:comments)}

  describe '#is_password?' do
    subject(:user) { User.create('username', 'password')}

    it 'identifies correct password as correct' do
      expect(user.is_password?('password')).to_be true
    end

    it 'identifies incorrect password as incorrect' do
      expect(user.is_password?('schpassword')).to_be true
    end
  end

  describe '#reset_session_token?' do
    subject(:user) { user.create('username', 'password'}
    let(:original_session_token) { user.session_token }

    it 'resets the session token' do
      expect(user.session_token).to_not eq(original_session_token)
    end
  end

  describe '#self.find_by_credentials' do
    subject(:user) { User.create('username', 'password')}

    it 'finds an actual user' do
      expect(user.find_by_credentials('username', 'password')).to eq(user)
    end

    it 'does not find an invalid user' do
      expect(user.find_by_credentials('schusername', 'password')).to eq(nil)
      expect(user.find_by_credentials('username', 'schpassword')).to eq(nil)
    end
  end
end
