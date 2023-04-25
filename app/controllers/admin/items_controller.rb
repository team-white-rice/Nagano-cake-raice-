class Admin::ItemsController < ApplicationController

  def index
    @menus = Menu.page(params[:page]).per(10)
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.save
    redirect_to admin_item_path(@menu.id)
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    menu = Menu.find(params[:id])
    menu.update(menu_params)
    redirect_to admin_item_path(menu.id)
  end

  private

  def menu_params
    params.require(:menu).permit( :menu_image, :name, :description, :genre_id, :price, :sale_status)
  end


end
