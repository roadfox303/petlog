class Pet < ApplicationRecord

  validates :name, presence: true, length: { maximum: 20 }
  validate :date_valid?

  has_many :bonds
  has_many :users, through: :bonds, dependent: :destroy
  belongs_to :owner, class_name: "User",foreign_key: "user_id"

  private
  def date_valid?
    if birthday.present? && join_day.present? && birthday > join_day
      errors.add(:birthday, ": 「お迎え日」より未来に設定することはできません")
      errors.add(:join_day, ": 「生年月日」より過去に設定することはできません")
    end
  end
end
