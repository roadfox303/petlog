class ChangeDatatypeIntrustOfPets < ActiveRecord::Migration[5.2]
  def up
    change_column_null :pets, :intrust, null: true
    change_column_default :pets, :intrust, nil
    change_column :pets, :intrust, 'boolean USING CAST(intrust AS boolean)', null: false
    change_column_default :pets, :intrust, false
  end
  def down
    change_column_null :pets, :intrust, null:true
    change_column_default :pets, :intrust, nil
    change_column :pets, :intrust, 'integer USING CAST(intrust AS integer)', null: false
    change_column_default :pets, :intrust, 0
  end
end
