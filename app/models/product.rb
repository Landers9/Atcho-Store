class Product < ApplicationRecord
  belongs_to :category
  has_many :orders_products, dependent: :destroy
  has_many :carts, dependent: :destroy

  mount_uploader :image, ImageUploader
end
