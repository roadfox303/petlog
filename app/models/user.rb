class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true,uniqueness: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password_digest, presence: true, length: { minimum: 8 }, unless: :password_blank?

  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :bonds
  has_many :pets, through: :bonds, dependent: :destroy

  attr_accessor :relation_category

  mount_uploader :avatar, ImageUploader
  attr_accessor :image_x
  attr_accessor :image_y
  attr_accessor :image_w
  attr_accessor :image_h

  def follow!(other_user)
  active_relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  private
  def password_blank?
    password.blank?
  end

end
