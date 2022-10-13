class Review < ApplicationRecord
  belongs_to :car
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :destroy
  
end
