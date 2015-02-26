require 'rails_helper'

RSpec.describe FlowersController, :type => :controller do

  describe "GET flower" do
    it "returns http success" do
      get :flower
      expect(response).to have_http_status(:success)
    end
  end

end
