class Content < ApplicationRecord
  belongs_to :pet
  has_many :records, dependent: :destroy
  # accepts_nested_attributes_for :records

  def pet_family?

  end
end
