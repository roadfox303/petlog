class CreateBonds < ActiveRecord::Migration[5.2]
  def change
    create_table :bonds do |t|
      t.references :user, index:true ,foreign_key: true
      t.references :pet, index:true ,foreign_key: true
      t.timestamps
    end
  end
end
