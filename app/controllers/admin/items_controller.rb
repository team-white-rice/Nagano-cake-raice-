class Admin::ItemsController < ApplicationController

  def index
  end

  def new
    @item = Menu.new
  end

  def create
    @item = Menu.new(menu_params)
    @item.save
    redirect_to admin_items_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def menu_params
    params.require(:menu).permit( :image, :name, :description, :genre_id, :price, :sale_status)
  end


end
