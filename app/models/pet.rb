class Pet < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validate :date_valid?

  has_many :bonds
  has_many :users, through: :bonds, dependent: :destroy
  belongs_to :owner, class_name: "User",foreign_key: "user_id"

  mount_uploader :avatar, ImageUploader
  attr_accessor :image_x
  attr_accessor :image_y
  attr_accessor :image_w
  attr_accessor :image_h

  def age
    if self.birthday
      age = calc_age(self.birthday)
      if age > 0
        "#{age} 歳"
      else
        "#{calc_month(self.birthday)} ヶ月"
      end
    elsif self.join_day && self.join_age
      "#{calc_age(self.join_day) + self.join_age} 歳"
    else
      "--"
    end
  end

  def family_users
    bonds_user([4,3])
  end

  def follower_users
    bonds_user([2,1])
  end

  private
  def date_valid?
    if birthday.present? && birthday > Date.today
      errors.add(:birthday, ": 「生年月日」を未来に設定することはできません")
    end
    if birthday.present? && join_day.present? && birthday > join_day
      errors.add(:birthday, ": 「お迎え日」より未来に設定することはできません")
      errors.add(:join_day, ": 「生年月日」より過去に設定することはできません")
    end
  end

  def calc_age(birthdayStr)
    return (Date.today.strftime("%Y%m%d").to_i - birthdayStr.strftime("%Y%m%d").to_i) / 10000
  end

  def calc_month(birthdayStr)
    return ((Date.today - birthdayStr).to_i / 30).floor
  end

  def bonds_user(relation)
    self.bonds.includes(:user, :relation_category).where(relation_category_id: relation)
  end
end
