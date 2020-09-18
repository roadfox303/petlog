class AddFamilyToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :family, :boolean, null: false, default: false
  end
end
