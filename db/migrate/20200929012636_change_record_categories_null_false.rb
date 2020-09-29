class ChangeRecordCategoriesNullFalse < ActiveRecord::Migration[5.2]
  def change
    change_column_null :record_categories, :pet_id, false
    change_column_null :record_categories, :icon_id, false, 0
  end
end
