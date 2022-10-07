class Review < ApplicationRecord
  has_many :likes, as: :likeable, dependent: :destroy
  belongs_to :car
end
