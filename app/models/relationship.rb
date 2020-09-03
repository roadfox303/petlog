class Relationship < ApplicationRecord
  belongs_to :followed, class_name: "User"
  belongs_to :follower, class_name: "User"
  belongs_to :relation_category

  def edit_family_pet(category)
    follower_pets = self.follower.pets.where(user_id: self.follower)
    followed_pets = self.followed.pets.where(user_id: self.followed)
    bonds_generator(self.follower, followed_pets, category)
  end
  # def disable_family_pet
  #   follower_pets = self.follower.pets.where(user_id: self.follower)
  #   followed_pets = self.followed.pets.where(user_id: self.followed)
  #   bonds_generator(self.follower, followed_pets, 1)
  # end

  def bonds_generator(user, pets, category)
    pets.map do |pet|
      bond = user.bonds.find_or_create_by(pet_id: pet)
      bond.pet_id = pet.id
      bond.relation_category_id = category
      bond.save
    end
  end
end
