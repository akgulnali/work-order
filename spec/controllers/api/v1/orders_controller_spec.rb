require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :controller do

  context "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_success
    end
  end

  context "GET #show_order_workers" do
    it "returns a success response" do
      @order = FactoryBot.create(:order_one)
      get :show_order_workers, params: {id: @order.to_param}
      expect(response).to be_success
    end
  end

  context "POST #create" do
    it "returns a success response" do
      post :create, params: {order: {title: "Order", description: "1st order", deadline: "2019-07-05"}}
      expect(response).to be_success
    end
  end
end