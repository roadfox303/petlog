class Relationship < ApplicationRecord
  belongs_to :followed, class_name: "User"
  belongs_to :follower, class_name: "User"
  belongs_to :relation_category

  def change_bonds_category(category)
    follower_pets = follower.pets.where(user_id: follower)
    followed_pets = followed.pets.where(user_id: followed)
    bonds_generator(follower, followed_pets, category)
  end

  def bonds_generator(user, pets, category)
    pets.map do |pet|
      bond = user.bonds.find_or_create_by(pet_id: pet)
      bond.pet_id = pet.id
      bond.relation_category_id = category
      bond.save
    end
  end
end
