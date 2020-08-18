class AddRelationCategoryIdToBonds < ActiveRecord::Migration[5.2]
  def change
    add_reference :bonds, :relation_category, foreign_key: true
  end
end
