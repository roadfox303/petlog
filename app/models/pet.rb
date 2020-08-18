class Pet < ApplicationRecord
  has_many :bonds
  has_many :users, through: :bonds, dependent: :destroy
end
