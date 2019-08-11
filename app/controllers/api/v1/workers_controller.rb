class Api::V1::WorkersController < ApplicationController
  before_action :set_worker, only: [:destroy, :assign_to_order]
  
  # POST ap/v1/workers
  def create
    begin
      @worker = Worker.new(worker_params)
      if @worker.save
        render json: @worker, status: :created, location: api_v1_worker_url(@worker)
      else
        render json: @worker.errors, status: :unprocessable_entity
      end
    rescue Exception => e
      render json: {errors: "Somthing went wrong!", status: :unprocessable_entity}
    end
  end

  # DELETE api/v1/workers/1
  def destroy
    begin
      @worker.destroy
      render json: { status: :ok, message: "Worker is succesfully deleted."}
    rescue Exception => e
      render json: {errors: "Somthing went wrong!", status: :unprocessable_entity}
    end
  end

  # PATCH api/v1/workers/1/assign
  def assign_to_order
    begin
      @order = Order.find(params[:order_id])
      @worker.order_id = @order.id
      if @worker.save
        render json: @worker, status: :ok, location: api_v1_worker_url(@worker)
      else
        render json: @worker.errors, status: :unprocessable_entity
      end
    rescue Exception => e
      render json: {errors: "Somthing went wrong!", status: :unprocessable_entity}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_worker
   @worker = Worker.find(params[:id])
  end

  # Only allow a trusted parameter “white list” through.
  def worker_params
    params.require(:worker).permit(:name, :company_name, :email)
  end
end
