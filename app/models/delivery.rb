class Delivery < ApplicationRecord

  belongs_to :customer

  def delivery_display
    '〒' + post_address + '' + address + '' + name
  end

end
