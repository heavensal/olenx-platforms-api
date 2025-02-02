require 'rails_helper'

RSpec.describe "Api::V1::Me::Portfolios", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/me/portfolios/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/me/portfolios/update"
      expect(response).to have_http_status(:success)
    end
  end

end
