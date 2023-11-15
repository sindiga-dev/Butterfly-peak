require 'rails_helper'

RSpec.describe Parent, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe "associations" do
    it { is_expected.to have_many(:reviews) }
  end

  describe "#create_token" do
    let(:parent) { create(:parent) }
    let(:decoded_token) { JWT.decode(parent.create_token, Rails.application.secrets.secret_key) }

    it "returns a token" do
      expect(parent.create_token).to be_present
    end

    it "encodes the correct information in the token" do
      expect(decoded_token.first["parent_id"]).to eq(parent.id)
    end
  end
end