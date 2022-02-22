class Category < ApplicationRecord
    has_many :products, dependent: :destroy
    belongs_to :category, optional: true
    has_many :categories, dependent: :destroy
end
