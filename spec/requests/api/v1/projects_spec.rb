require 'rails_helper'

RSpec.describe "Api::V1::Projects", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/projects/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/projects/show"
      expect(response).to have_http_status(:success)
    end
  end
end
