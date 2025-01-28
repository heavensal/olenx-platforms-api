require 'rails_helper'

RSpec.describe "Api::V1::Portfolios", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/portfolios/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/portfolios/show"
      expect(response).to have_http_status(:success)
    end
  end
end
