class Record < ApplicationRecord
  belongs_to :content
  belongs_to :record_category
  belongs_to :user
end
