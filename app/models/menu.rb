class Menu < ApplicationRecord
  has_one_attached :menu_image

  validates :name, presence: true
  validates :price,  presence: true

end
