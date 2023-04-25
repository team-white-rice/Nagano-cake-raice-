class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :menu

  after_initialize :set_default_item_quantity

  private

  def set_default_item_quantity
    self.item_quantity ||= 1
  end

end
