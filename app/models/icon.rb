class Icon < ApplicationRecord
  has_many :icon_animals, dependent: :destroy
  has_many :icon_cares, dependent: :destroy
  has_many :icon_events, dependent: :destroy
end

class IconEvent < Icon
end

class IconCare < Icon
end

class IconAnimal < Icon
end

class IconEmotion < Icon
end
