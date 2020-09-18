class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.string :avatar
      t.string :species
      t.string :sex
      t.date :birthday
      t.date :join_day
      t.integer :join_age
      t.text :comment
      t.integer :intrust, null:false, default:0
      t.timestamps
      t.index :intrust
    end
  end
end
