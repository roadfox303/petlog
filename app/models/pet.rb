class Pet < ApplicationRecord

  validates :name, presence: true, length: { maximum: 20 }
  validate :date_valid?

  has_many :bonds
  has_many :users, through: :bonds, dependent: :destroy
  belongs_to :owner, class_name: "User",foreign_key: "user_id"

  def age
    if self.birthday
      calcAge(self.birthday)
    elsif self.join_day && self.join_age
      calcAge(self.join_day) + self.join_age
    else
      "--"
    end
  end

  private
  def date_valid?
    if birthday.present? && join_day.present? && birthday > join_day
      errors.add(:birthday, ": 「お迎え日」より未来に設定することはできません")
      errors.add(:join_day, ": 「生年月日」より過去に設定することはできません")
    end
  end
  def calcAge(birthdayStr)
    return (Date.today.strftime("%Y%m%d").to_i - birthdayStr.strftime("%Y%m%d").to_i) / 10000
  end
end
