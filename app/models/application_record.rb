class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def pet_owner?
    true if self&.user_id == current_user.id
  end
end
