class Record < ApplicationRecord
  belongs_to :calendar
  belongs_to :record_category
  belongs_to :user
end
