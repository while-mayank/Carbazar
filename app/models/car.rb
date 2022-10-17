class Car < ApplicationRecord
  belongs_to :user
  has_many :inquiries, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  validates :brand, :model, :price, :manufacture_year, :images, :fuel_type, presence: true
end