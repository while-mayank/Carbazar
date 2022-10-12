class Car < ApplicationRecord
  belongs_to :user
  has_many :inquiries
  has_many :reviews
  has_many_attached :images
  has_many :inquiries
  has_many :likes, as: :likeable, dependent: :destroy
end