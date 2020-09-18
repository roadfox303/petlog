class Calendar < ApplicationRecord
  validates :have_on, presence: true

  belongs_to :pet
  has_many :records, dependent: :destroy
end
