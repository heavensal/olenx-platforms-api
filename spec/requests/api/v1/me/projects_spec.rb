require 'rails_helper'

RSpec.describe "Api::V1::Me::Projects", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/me/projects/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/me/projects/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/me/projects/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/me/projects/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/v1/me/projects/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
