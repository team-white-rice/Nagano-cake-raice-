class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def create
    puts params.inspect
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(menu_id: params[:cart_item][:menu_id]).present?
      cart_item = current_customer.cart_items.find_by(menu_id: params[:cart_item][:menu_id])
      cart_item.item_quantity += params[:cart_item][:item_quantity].to_i
      cart_item.save
      redirect_to cart_items_path
    elsif @cart_item.save
      @cart_items = current_customer.cart_items.all
      render 'index'
    else
      render 'index'
    end
  end

  def index
    @cart_items = current_customer.cart_items.all
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    @cart_items = CartItem.all
    render 'index'
  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
    render 'index'
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:menu_id, :price, :item_quantity)
  end
end
