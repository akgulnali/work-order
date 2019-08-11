class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: [:show_order_workers]
  
  # GET api/v1//orders
  def index
    begin
      @orders = Order.all.order(deadline: :asc) # Orders sorted by deadine
      render json: @orders
    rescue Exception => e
      render json: {errors: "Somthing went wrong!", status: :unprocessable_entity}
    end
  end
  
  # GET api/v1/orders/1/workers
  def show_order_workers
    begin
      @orders = @order.workers
      render json: @orders
    rescue Exception => e
      render json: {errors: "Somthing went wrong!", status: :unprocessable_entity}
    end
  end

  # POST api/v1/orders
  def create
    begin
      @order = Order.new(order_params)
      if @order.save
        render json: @order, status: :created, location: api_v1_order_url(@order)
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    rescue Exception => e
      render json: {errors: "Somthing went wrong!", status: :unprocessable_entity}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a trusted parameter “white list” through.
  def order_params
    params.require(:order).permit(:title, :description, :deadline)
  end
end
