class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :deliveries, dependent: :destroy
  has_many :orders, dependent: :destroy


  # validates :last_name, length: { minimum: 2 }
  # validates :first_name, length: { minimum: 2 }
  # validates :last_name_kana, length: { minimum: 2 }
  # validates :first_name_kana, length: { minimum: 2 }
  # validates :postal_code, length: { minimum: 2 }
  # validates :address, length: { minimum: 2 }
  # validates :phone_number, length: { minimum: 2 }
  # validates :email, length: { minimum: 2 }, uniqueness: true

end
