require 'rails_helper'

RSpec.describe ParentsSessionsController, type: :request do
  let!(:parent) { create(:parent) }

  describe "POST #create" do
    context "with valid credentials" do
      before { post parents_sessions_path, params: { email: parent.email, password: parent.password } }

      it "returns a status of 201" do
        expect(response).to have_http_status(:created)
      end

      it "returns a token" do
        expect(json["token"]).to be_present
      end
    end

    context "with invalid credentials" do
      before { post parents_sessions_path, params: { email: parent.email, password: "wrong_password" } }

      it "returns a status of 401" do
        expect(response).to have_http_status(:unauthorized)
      end

      it "returns an error message" do
        expect(json["errors"]).to eq("Invalid email or password")
      end
    end
  end

  describe "DELETE #destroy" do
    context "when a user is signed in" do
      before do
        post parents_sessions_path, params: { email: parent.email, password: parent.password }
        delete parents_sessions_path
      end

      it "returns a status of 204" do
        expect(response).to have_http_status(:no_content)
      end

      it "signs out the user" do
        expect(session[:parent_id]).to be_nil
      end
    end

    context "when a user is not signed in" do
      before { delete parents_sessions_path }

      it "returns a status of 401" do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
