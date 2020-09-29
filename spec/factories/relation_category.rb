FactoryBot.define do
  factory :relation_category_1, class: RelationCategory do
    title { 'フォロワー' }
  end
  factory :relation_category_2, class: RelationCategory do
    title { '元飼い主' }
  end
  factory :relation_category_3, class: RelationCategory do
    title { '家族' }
  end
  factory :relation_category_4, class: RelationCategory do
    title { 'オーナー' }
  end
end
