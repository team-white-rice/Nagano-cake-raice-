class Public::ItemsController < ApplicationController

  def index
    @menus = Menu.all
    @genres = Genre.all
    if params[:genre_id]
      @menus = Menu.where(genre_id: params[:genre_id])
    else
      @menus = Menu.all
    end
  end

  def show
    @menu = Menu.find(params[:id])
    @genres = Genre.all
    @cart_item_new = CartItem.new
  end
end
