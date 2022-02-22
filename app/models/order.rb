class Order < ApplicationRecord
  belongs_to :user
  has_many :orders_products, dependent: :destroy
end
