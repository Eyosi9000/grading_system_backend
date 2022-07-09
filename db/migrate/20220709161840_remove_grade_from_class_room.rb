class RemoveGradeFromClassRoom < ActiveRecord::Migration[7.0]
  def change
    remove_column :class_rooms, :grade, :string
  end
end
