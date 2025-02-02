require 'rails_helper'

RSpec.describe "Api::V1::Admin::Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/admin/users/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/admin/users/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/admin/users/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/v1/admin/users/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
