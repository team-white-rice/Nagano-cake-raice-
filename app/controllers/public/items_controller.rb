class Public::ItemsController < ApplicationController

  def index
    @menus = Menu.all
  end

end
