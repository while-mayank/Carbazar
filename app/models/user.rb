class User < ApplicationRecord

  validates :user_name, :mobile, presence: true
  has_many :likes
  has_many :reviews
  has_one :profile, :dependent => :destroy
  has_many :cars

  after_create :set_profile

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  attr_accessor :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  def set_profile
    self.create_profile
  end

  attr_writer :login

  def login
    @login || self.user_name || self.email || self.mobile
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(user_name) = :value OR lower(email) = :value OR lower(mobile) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:user_name) || conditions.has_key?(:email) || conditions.has_key?(:mobile)
      where(conditions.to_h).first
    end
  end
end
