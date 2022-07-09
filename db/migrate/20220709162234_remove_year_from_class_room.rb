class RemoveYearFromClassRoom < ActiveRecord::Migration[7.0]
  def change
    remove_column :class_rooms, :year, :integer
  end
end
