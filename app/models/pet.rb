class Pet < ApplicationRecord

  validates :name, presence: true
  validate :date_valid?

  has_many :bonds
  has_many :users, through: :bonds, dependent: :destroy

  private
  def date_valid?

  end
end
