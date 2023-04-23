class Public::HomesController < ApplicationController

  def top
    @menus = Menu.all.order(id: "DESC").limit(4)
    @genres = Genre.all
  end
end
