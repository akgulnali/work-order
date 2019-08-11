require 'rails_helper'

RSpec.describe Api::V1::WorkersController, type: :controller do

  context "POST #create" do
    it "returns a success response" do
      post :create, params: {worker: {name: "Worker", company_name: "Company A", email: "worker@mail.com"}}
      expect(response).to be_success
    end
  end

  context "DESTROY #destroy" do
    it "should delete the worker with given id" do
      @worker = FactoryBot.create(:worker_one)
      delete :destroy, params: {id: @worker.to_param}
      expect(Worker.where(id: @worker.id).count).to eq(0)
    end
  end

  context "PATCH #assign_to_order" do
    it "returns a success response" do
      @order = FactoryBot.create(:order_one)
      @worker = FactoryBot.create(:worker_one)
      patch :assign_to_order, params: {id: @worker.to_param, order_id: @order.to_param}
      expect(response).to be_success
    end

    it "returns a status fail response" do
      @order = FactoryBot.create(:order_one)
      @worker1 = FactoryBot.create(:worker_one, order_id: @order.to_param)
      @worker2 = FactoryBot.create(:worker_one, order_id: @order.to_param)
      @worker3 = FactoryBot.create(:worker_one, order_id: @order.to_param)
      @worker4 = FactoryBot.create(:worker_one, order_id: @order.to_param)
      @worker5 = FactoryBot.create(:worker_one, order_id: @order.to_param)
      @worker6 = FactoryBot.create(:worker_one)

      patch :assign_to_order, params: {id: @worker6.to_param, order_id: @order.to_param}
      expect(response).not_to be_success
    end
  end
end