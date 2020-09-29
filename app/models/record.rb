class Record < ApplicationRecord
  belongs_to :content
  belongs_to :record_category
  belongs_to :user

  validates :content_id, presence: true
  validates :record_category_id, presence: true
  validates :user_id, presence: true

end
