class AddWeekdayToSlots < ActiveRecord::Migration[7.0]
  def change
    add_column :slots, :weekday, :integer, null: false
  end
end
