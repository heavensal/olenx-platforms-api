require 'rails_helper'

RSpec.describe "Api::V1::Me::Ideas", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/me/ideas/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/me/ideas/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/me/ideas/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/me/ideas/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/v1/me/ideas/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
