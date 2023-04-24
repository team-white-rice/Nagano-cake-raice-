class Order < ApplicationRecord

  belongs_to :customer

  has_many :order_details, dependent: :destroy

  enum status: {
    wait_payment:0, confirm_payment:1, in_production:2, preparing_to_shi:3, already_shipped:4
   }

  enum payment_method: {
    credit_card:0, transfer:1
   }

end
