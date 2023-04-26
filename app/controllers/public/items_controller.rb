class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    if params[:genre_id]
      @menus = Menu.where(genre_id: params[:genre_id]).page(params[:page]).per(8)
    else
      @menus = Menu.page(params[:page]).per(8)
    end
  end

  def show
    @menu = Menu.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end
end
