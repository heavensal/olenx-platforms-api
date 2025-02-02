require 'rails_helper'

RSpec.describe "Api::V1::Admin::Reactions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/admin/reactions/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/admin/reactions/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/admin/reactions/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/v1/admin/reactions/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
