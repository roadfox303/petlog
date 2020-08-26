class Bond < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  belongs_to :relation_category
end
