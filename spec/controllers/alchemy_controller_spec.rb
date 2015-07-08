require 'rails_helper'

RSpec.describe AlchemyController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #query" do
    it "returns http success" do
      get :query
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #persist" do
    it "returns http success" do
      get :persist
      expect(response).to have_http_status(:success)
    end
  end

end
