require 'rails_helper'

RSpec.describe Caregiver, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe "associations" do
    it { is_expected.to have_many(:reviews) }
  end
  
  describe "#create_token" do
    let(:caregiver) { create(:caregiver) }
    let(:decoded_token) { JWT.decode(caregiver.create_token, Rails.application.secrets.secret_key) }

    it "returns a token" do
      expect(caregiver.create_token).to be_present
    end

    it "encodes the correct information in the token" do
      expect(decoded_token.first["caregiver_id"]).to eq(caregiver.id)
    end
  end
end 