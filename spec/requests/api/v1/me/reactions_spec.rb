require 'rails_helper'

RSpec.describe "Api::V1::Me::Reactions", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/me/reactions/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/me/reactions/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/v1/me/reactions/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
