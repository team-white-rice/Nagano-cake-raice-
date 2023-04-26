class Menu < ApplicationRecord
  has_one_attached :menu_image

  validates :name, presence: true
  validates :price,  presence: true

  has_many :cart_items, dependent: :destroy
  has_many :orders_details, dependent: :destroy

  belongs_to :genre

end
