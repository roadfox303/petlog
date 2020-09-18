class CreateIcons < ActiveRecord::Migration[5.2]
  def change
    create_table :icons do |t|
      t.string :name, null: false
      t.string :style, null: false
      t.string :type
      t.timestamps
    end
  end
end
