require 'rails_helper'

RSpec.describe "Api::V1::Admin::Ideas", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/admin/ideas/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/admin/ideas/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/admin/ideas/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/v1/admin/ideas/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
