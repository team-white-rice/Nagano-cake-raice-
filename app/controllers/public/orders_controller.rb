class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @delivery = current_customer.deliveries.all
  end

  def show
  end

  def index
    @order = current_customer.orders.all
  end


  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_delivery] == "0"
      @order.postcode = current_customer.postal_code
      @order.ship_to_address = current_customer.address
      @order.ship_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_delivery] == "1"
      @delivery = Delivery.find(params[:order][:address_id])
      @order.postcode =  @delivery.post_address
      @order.ship_to_address =  @delivery.address
      @order.ship_name =  @delivery.name
    elsif params[:order][:select_delivery] == "2"
      @order.customer_id = current_customer.id
    end
      @cart_items = current_customer.cart_items
      @order_new = Order.new
      render :confirm
  end

  def create
    @order = Order.new(order_params)
    @order.save!
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = @order.id
      @order_details.menu_id = cart_item.menu.id
      @order_details.item_price = cart_item.menu.price
      @order_details.quantity = cart_item.item_quantity
      @order_details.production_status = 0
      @order_details.save!
    end
    CartItem.destroy_all
    redirect_to complete_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postcode, :ship_to_address, :ship_name, :customer_id , :status, :freight, :total_price)
  end


  def cartitem_nill
    cart_items = current_customer.cart_items
    if cart_items.blank?
      redirect_to complete_orders_path
    end
  end


end
