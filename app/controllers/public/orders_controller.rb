class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @delivery = Delivery.all
  end

  def confirm
    @order = Oder.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @delivery = Delivery.find(params[:order][:address_id])
      @order.postal_code =  @delivery.postal_code
      @order.address =  @delivery.address
      @order.name =  @delivery.name
    elsif params[:order][:select_address] == "2"
      @order.customer = current_customer
    end
      @cart_items = current_customer.cart_items
      @order_new = Order.new
      render :confirm
  end


  private

  def order_params
    params.require(:order).permit(:payment_methods, :postal_code, :address, :name)
  end


end
