class RelationCategory < ApplicationRecord
  has_many :bonds
  has_many :relationships
end
