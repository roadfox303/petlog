class RecordCategory < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :icon_id, presence: true
  validates :pet_id, presence: true

  belongs_to :pet
  belongs_to :icon
  has_many :records, dependent: :destroy
end
