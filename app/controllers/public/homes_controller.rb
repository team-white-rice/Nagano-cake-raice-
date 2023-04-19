class Public::HomesController < ApplicationController

  def top
    @menu = Menu.all.order(id: "DESC").limit(4) ## idの降順
  end
end
