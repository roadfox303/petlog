class CreateRecordCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :record_categories do |t|
      t.string :title, null: false
      t.text :description
      t.references :pet, index:true ,foreign_key: true
      t.references :icon, index:true ,foreign_key: true
      t.timestamps
    end
  end
end
