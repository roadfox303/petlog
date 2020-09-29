class ChangePetsUserIdAddNullFalse < ActiveRecord::Migration[5.2]
  def change
    change_column_null :pets, :user_id, false
  end
end
