require 'rails_helper'

RSpec.describe "Api::V1::Admin::Projects", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/admin/projects/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/admin/projects/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/admin/projects/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/v1/admin/projects/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
