class Public::DeliveriesController < ApplicationController

  def index
    @delivery_new = Delivery.new
    @deliveries = Delivery.all
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    @delivery.save
    redirect_to deliveries_path
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    delivery = Delivery.find(params[:id])
    delivery.update(delivery_params)
    redirect_to action: :index
  end

  def destroy
    delivery = Delivery.find(params[:id])
    delivery.destroy
    redirect_to action: :index
  end

  private
  def delivery_params
    params.require(:delivery).permit(:post_address, :address, :name)
  end
end

