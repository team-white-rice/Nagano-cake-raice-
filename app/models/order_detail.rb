class OrderDetail < ApplicationRecord

  belongs_to :menu
  belongs_to :order

  enum production_status: {
     cant_start:0, awaiting_manufacture:1, manufacturing:2, finish:3
   }
end
