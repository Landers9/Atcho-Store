class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :carts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :recoverable

  mount_uploader :image, ImageUploader
end

# :confirmable
