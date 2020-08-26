class AddUserIdToPets < ActiveRecord::Migration[5.2]
  def change
    add_reference :pets, :user, foreign_key: true
  end
end
