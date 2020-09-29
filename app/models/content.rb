class Content < ApplicationRecord
  belongs_to :pet
  has_many :records, dependent: :destroy

  validates :have_on, presence: true
end
