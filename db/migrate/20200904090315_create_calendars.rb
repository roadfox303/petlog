class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.date :have_on, null: false, index:true
      t.references :pet, index:true ,foreign_key: true
      t.timestamps
    end
  end
end
