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
