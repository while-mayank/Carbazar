class User < ApplicationRecord
  after_create :set_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, :dependent => :destroy
  has_many :inquiries
  has_many :cars

  def set_profile
    self.create_profile
  end
end
