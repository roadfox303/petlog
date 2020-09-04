class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :memo
      t.references :calendar, index:true ,foreign_key: true
      t.references :record_category, index:true ,foreign_key: true
      t.references :user, index:true ,foreign_key: true
      t.timestamps
    end
  end
end
