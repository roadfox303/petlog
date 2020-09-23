class RecordCategory < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }

  belongs_to :pet
  belongs_to :icon
  has_many :records, dependent: :destroy
end
