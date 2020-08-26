class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true,uniqueness: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password_digest, presence: true, length: { minimum: 8 }, unless: :password_blank?

  has_many :bonds
  has_many :pets, through: :bonds, dependent: :destroy
  attr_accessor :relation_category

  private
  def password_blank?
    password.blank?
  end

end
