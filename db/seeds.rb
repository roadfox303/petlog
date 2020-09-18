# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if RelationCategory.count == 0
  RelationCategory.create(title: 'フォロワー')
  RelationCategory.create(title: '元飼い主')
  RelationCategory.create(title: '家族')
  RelationCategory.create(title: 'オーナー')
end


if Icon.count == 0
  IconAnimal.create! [
    { name: '肉球', style: 'fas fa-paw'},
    { name: '犬', style: 'fas fa-dog'},
    { name: '猫', style: 'fas fa-cat'},
    { name: '鳥', style: 'fas fa-dove'},
    { name: '魚', style: 'fas fa-fish'},
    { name: '爬虫類', style: 'fas fa-otter'},
    { name: '両生類', style: 'fas fa-frog'},
    { name: '虫', style: 'fas fa-spider'},
    { name: '馬', style: 'fas fa-horse-head'}
  ]

  IconCare.create! [
    { name: '食事', style: 'fas fa-drumstick-bite'},
    { name: 'おやつ', style: 'fas fa-cookie-bite'},
    { name: 'さんぽ', style: 'fas fa-walking'},
    { name: '遊ぶ', style: 'fas fa-futbol'},
    { name: 'トイレ', style: 'fas fa-toilet'},
    { name: '掃除', style: 'fas fa-quidditch'},
    { name: '薬', style: 'fas fa-pills'},
    { name: 'お風呂', style: 'fas fa-bath'},
    { name: '爪切り', style: 'fas fa-hand-sparkles'},
    { name: 'トリミング', style: 'fas fa-cut'},
    { name: '体重', style: 'fas fa-weight'},
    { name: '体温', style: 'fas fa-temperature-high'}
  ]

  IconEvent.create! [
    { name: '病院', style: 'fas fa-hospital'},
    { name: '注射', style: 'fas fa-syringe'},
    { name: '写真撮影', style: 'fas fa-camera-retro'},
    { name: '動画撮影', style: 'fas fa-video'},
    { name: 'おでかけ', style: 'fas fa-suitcase-rolling'},
    { name: 'ペットシッター', style: 'fas fa-baby-carriage'},
    { name: 'アニバーサリー', style: 'fas fa-birthday-cake'},
    { name: 'ギフト', style: 'fas fa-gift'},
    { name: 'アワード', style: 'fas fa-award'},
    { name: '葬儀', style: 'fas fa-monument'},
    { name: '出荷', style: 'fas fa-caravan'}
  ]

  IconEmotion.create! [
    { name: 'ハッピー', style: 'far fa-laugh-squint'},
    { name: 'スマイル', style: 'far fa-smile-beam'},
    { name: 'ウインク', style: 'far fa-grin-wink'},
    { name: '普通', style: 'far fa-grin'},
    { name: '無表情', style: 'far fa-meh'},
    { name: '涙', style: 'far fa-sad-tear'},
    { name: '号泣', style: 'far fa-tired'},
    { name: '怒り', style: 'far fa-angry'},
    { name: 'いたずら', style: 'far fa-grin-tongue-wink'},
    { name: 'ハート', style: 'far fa-grin-hearts'},
    { name: '汗', style: 'far fa-grin-beam-sweat'},
    { name: '驚き', style: 'far fa-flushed'},
    { name: 'ダウン', style: 'far fa-dizzy'}
  ]
end
