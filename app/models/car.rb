class Car < ApplicationRecord
  belongs_to :user
  has_many :inquiries
  has_many :reviews
  has_many_attached :images
  has_many :inquiries
  has_many :likes, as: :likeable, dependent: :destroy
  validates :brand, :model, :price, :manufacture_year, :fuel_type, :images, presence: true
end