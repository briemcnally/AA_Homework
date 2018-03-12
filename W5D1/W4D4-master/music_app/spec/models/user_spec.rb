require 'rails_helper'

describe User do
  subject(:user) do
    FactoryBot.build(:username,
      email: "brie@brie.com",
      password: "random_password"
    )
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#is_password?" do
    it "verifies the password is correct"
    expect(user.is_password?("random_password")).to be true
  end

  describe "#is_password?" do
    it "verifies the password is correct"
    expect(user.is_password?("other_password")).to be false
  end

  describe "#reset_session_token!" do
    it "sets a new session token for the user" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_session_token)
    end

    it "returns the new sessoion token" do
      expect(user.reset_session_token!).to eq(user.session_token)
  end

  describe ".find_by_credentials" do
    before { user.save! }

    it "returns user if given stored credentials" do
      expect(User.find_by_credentials("brie@brie.com", "random_password")).to eq(user)
    end

    it "returns nil if not given stored credentials" do
      expect(User.find_by_credentials("brie@brie.com", "other_password")).to eq(nil)
    end
  end

end
